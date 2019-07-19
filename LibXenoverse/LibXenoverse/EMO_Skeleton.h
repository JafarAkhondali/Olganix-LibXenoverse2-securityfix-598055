#ifndef __EMO_SKELETON_H__
#define __EMO_SKELETON_H__

#include <stdint.h>

#include <string>
#include <vector>
#include <stdexcept>

#include "EMO_BaseFile.h"

namespace LibXenoverse
{


#ifdef _MSC_VER
#ifndef FBX_SUPPORT
 #define FBX_SUPPORT
#endif
#endif

#ifdef FBX_SUPPORT
#include <fbxsdk.h>
#endif

#ifdef _MSC_VER
#pragma pack(push,1)
#endif




struct SkeletonHeader
{
	uint16_t node_count;		// 0
	uint16_t unk_02;			// 2
	uint16_t ik_count;          // 4
	uint16_t unk_06;            // 6
	uint32_t start_offset;		// 8
	uint32_t names_offset;		// 0x0C
	uint32_t unk_10[2];			// 0x10
	uint32_t unk_skd_offset;	// 0x18   UnkSkeletonData
	uint32_t matrix_offset;		// 0x1C   MatrixData
	uint32_t ik_data_offset;	// 0x20   only one entry!
	uint32_t unk_24[4];		// 0x24 apprently 0
	uint16_t unk_34[2];         // 0x34
	float unk_38[2];            // 0x38
	// 0x40
} PACKED;
static_assert(sizeof(SkeletonHeader) == 0x40, "Incorrect structure size.");


struct SkeletonNode
{
	uint16_t parent_id;			// 0
	uint16_t child_id;			// 2
	uint16_t sibling_id;		// 4
	uint16_t emgIndex;			// 6		//only for Emo file (0xFFFF for other)
	uint16_t index_4;			// 8
	uint16_t unk_0A[3];			// 0xA
	float matrix[16];			// 0x10
	// 0x50
} PACKED;
static_assert(sizeof(SkeletonNode) == 0x50, "Incorrect structure size.");


struct UnkSkeletonData
{
	uint16_t unk_00[4]; // 0
	// 8
} PACKED;
static_assert(sizeof(UnkSkeletonData) == 8, "Incorrect structure size.");


struct MatrixData
{
	float matrix_00[16]; // 0
	// 0x40
} PACKED;
static_assert(sizeof(MatrixData) == 0x40, "Incorrect structure size.");


#ifdef _MSC_VER
#pragma pack(pop)
#endif


class EMO_Bone;
class EMO_Skeleton;
class EMO;
class BoneSorter;



/********************************************************************************************
*									EMO_Bone												*
********************************************************************************************/
class Emo_IK_Relation											//Inverse Kinematic.
{
public:
	struct IKR_Bone
	{
		EMO_Bone* bone;
		float value;

		IKR_Bone(EMO_Bone* bone = 0, float value = 0.0f) { this->bone = bone; this->value = value; }
	};

	std::vector<IKR_Bone> mListBones;

	Emo_IK_Relation() {};
	~Emo_IK_Relation() {};

	bool operator==(const Emo_IK_Relation &other) const { size_t nbIk = mListBones.size(); if (other.mListBones.size() != nbIk) { return false; }  for (size_t i = 0; i < nbIk; i++)  {  if ((mListBones.at(i).bone != other.mListBones.at(i).bone)|| (mListBones.at(i).value != other.mListBones.at(i).value)) { return false; }  }  return true; }
	bool operator!=(const Emo_IK_Relation &other) const { return !(*this == other); }
};


class Emo_IK_Group												//group of inverse Kinematic.
{
public:
	std::vector<Emo_IK_Relation> mListIK;

	Emo_IK_Group() {};
	~Emo_IK_Group() {};

	bool operator==(const Emo_IK_Group &other) const { size_t nbIk = mListIK.size(); if (other.mListIK.size() != nbIk) { return false; } for (size_t i = 0; i < nbIk; i++) { if (mListIK.at(i) != other.mListIK.at(i)) { return false; } } return true; }
	bool operator!=(const Emo_IK_Group &other) const {return !(*this == other); }
};



/********************************************************************************************
*									EMO_Bone												*
********************************************************************************************/
class EMO_Bone
{
	friend class EMO_Skeleton;
	friend class EMO;
	friend class EMA;

private:
	std::string name;

	EMO_Bone *parent = nullptr;
	EMO_Bone *child = nullptr;
	EMO_Bone *sibling = nullptr;
	unsigned short emgIndex = 0xffff;				//only for Emo file (0xFFFF for other)
	unsigned short index_4 = 0xffff;

	float matrix1[16];								//apparently, it's the relative matrix, relative to parent.
	float matrix2[16];								//apparently, it's the absolute matrix Transform.

	uint16_t sn_u0A[3];
	uint16_t usd_u00[4];

	bool has_unk, has_matrix2;

	// METADATA - DON'T USE IN COMPARISON!
	// This is only to display information about original file.
	// This looses its meaning when the skeleton is modified
	uint32_t meta_original_offset;

	static void DecompileTransformationMatrix(TiXmlElement *root, const char *name, const float *matrix);
	static int CompileTransformationMatrix(const TiXmlElement *root, const char *name, float *matrix, bool must_exist);
	static bool PartialCompare(const EMO_Bone *b1, const EMO_Bone *b2);


public:
	EMO_Bone(void)
	{
		has_unk = true;
		has_matrix2 = false;
		for (size_t i = 0; i < 16; i++)
		{
			matrix1[i] = 0.0f;
			matrix2[i] = 0.0f;
		}
		matrix1[0] = matrix1[5] = matrix1[10] = matrix1[15] = 1.0f;			//iddentity

		sn_u0A[1] = sn_u0A[2] = sn_u0A[3] = 0;
		sn_u0A[0] = 0;
		usd_u00[0] = usd_u00[1] = usd_u00[3] = 0;
		usd_u00[2] = 65535;
	}

	inline std::string GetName() const { return name; }

	inline uint32_t GetOriginalOffset() const { return meta_original_offset; }

	inline void GetMatrix1(float *m) const { memcpy(m, matrix1, sizeof(matrix1));}

	inline bool GetMatrix2(float *m) const
	{
		if (!has_matrix2)
			return false;

		memcpy(m, matrix2, sizeof(matrix2));
		return true;
	}

	void SetMatrix(float *m)
	{
		memcpy(matrix1, m, sizeof(matrix1));
	}

	bool SetMatrix2(float *m)
	{
		if (!has_matrix2)
			return false;

		memcpy(matrix2, m, sizeof(matrix2));
		return true;
	}

	inline bool HasMatrix2() const { return has_matrix2; }

	inline void SetHasMatrix2(bool has_matrix2) { this->has_matrix2 = has_matrix2; }

	inline EMO_Bone *GetParent() { return parent; }
	inline EMO_Bone *GetChild() { return child; }
	inline EMO_Bone *GetSibling() { return sibling; }
	inline unsigned short GetEmgIndex() { return emgIndex; }
	inline unsigned short GetIndex_4() { return index_4; }

	inline const EMO_Bone *GetParent() const { return parent; }
	inline const EMO_Bone *GetChild() const { return child; }
	inline const EMO_Bone *GetSibling() const { return sibling; }
	inline const unsigned short GetEmgIndex() const { return emgIndex; }
	inline const unsigned short  GetIndex_4() const { return index_4; }

	inline void SetName(const std::string & str)
	{
		name = str;
	}

	void Decompile(TiXmlNode *root) const;
	bool Compile(const TiXmlElement *root, EMO_Skeleton *skl);
	

	void readESKBone(ESKBone* esk);
	void writeESKBone(ESKBone* esk);


#ifdef FBX_SUPPORT

	FbxAMatrix GetGlobalTransform() const;

	static void FbxMatrixToArray(float *mo, const FbxMatrix *mi);
	static void FbxMatrixToArray(double *mo, const FbxMatrix *mi);
	static FbxMatrix ArrayToFbxMatrix(const float *mi);
	static FbxAMatrix ArrayToFbxAMatrix(const float *mi);

	static FbxAMatrix GetGlobalDefaultPosition(FbxNode* node);
	static void SetGlobalDefaultPosition(FbxNode* node, FbxAMatrix global_position);

#endif

	bool operator==(const EMO_Bone & rhs) const;
	inline bool operator!=(const EMO_Bone & rhs) const
	{
		return !(*this == rhs);
	}

};






/********************************************************************************************
*									EMO_Skeleton											*
********************************************************************************************/
class EMO_Skeleton : public EMO_BaseFile
{
friend class EmgFile;
friend class SubPart;
friend class BoneSorter;
friend class EMO;
friend class EMA;

private:
	uint16_t unk_02;
	uint16_t unk_06;

	uint32_t unk_10[2];
	uint16_t unk_34[2];
	float unk_38[2];

protected:
	std::vector<EMO_Bone> bones;
	std::vector<Emo_IK_Group> listInverseKinematic;

	



public:
	EMO_Skeleton(void);
	EMO_Skeleton(uint8_t *buf, unsigned int size);
	EMO_Skeleton(const EMO_Skeleton &other) { Copy(other); }
	virtual ~EMO_Skeleton();


	inline uint16_t GetNumBones() const { return bones.size(); }
	uint16_t BoneToIndex(EMO_Bone *bone) const;
	std::vector<EMO_Bone> &GetBones() { return bones; }
	inline EMO_Bone *GetBone(uint16_t idx);
	inline EMO_Bone *GetBone(const std::string &name);
	inline const EMO_Bone *GetBone(const std::string &name) const;
	inline bool BoneExists(const std::string &name) const { return (GetBone(name) != nullptr); }

	uint16_t AppendBone(const EMO_Bone &bone);
	uint16_t AppendBone(const EMO_Skeleton &other, const std::string &name);

	bool CloneEMO_BoneParentChild(const EMO_Skeleton &other, const std::string &bone_name, EMO_Bone **not_found = nullptr);

	virtual bool Load(const uint8_t *buf, unsigned int size) override;
	virtual uint8_t *CreateFile(unsigned int *psize) override;
	virtual uint8_t *CreateFile(unsigned int *psize, std::vector<string> listEMG);
	unsigned int CalculateFileSize() const;
	size_t	calculIksize() const;


	void Decompile(TiXmlNode *root) const;
	virtual TiXmlDocument *Decompile() const override;
	bool Compile(const TiXmlElement *root);
	virtual bool Compile(TiXmlDocument *doc, bool big_endian = false) override;

	virtual bool SaveSkeletonToFile(const std::string &path, bool show_error = true, bool build_path = false);
	virtual bool DecompileSkeletonToFile(const std::string &path, bool show_error = true, bool build_path = false);


	void Copy(const EMO_Skeleton &other);
	void Reset();

	static uint16_t FindBone(const std::vector<EMO_Bone *> &bones, EMO_Bone *bone, bool assert_if_not_found);
	virtual void RebuildSkeleton(const std::vector<EMO_Bone *> &old_bones_ptr);

	

	void writeEsk(ESK* esk);										//need read esk before emd, because of pointer
	void writeEsk__recursive(EMO_Bone* emoBone, std::vector<EMO_Bone> &bones, EskTreeNode* treeNode, std::vector<EskTreeNode*> &listTreeNode);


#ifdef FBX_SUPPORT

	bool ExportFbxBone(const EMO_Bone *parent, FbxNode *root_node, FbxScene *scene, std::vector<FbxNode *> &fbx_bones) const;
	bool ExportFbx(FbxScene *scene, std::vector<FbxNode *> &fbx_bones) const;

#endif

	inline EMO_Skeleton &operator=(const EMO_Skeleton &other)
	{
		if (this == &other)
			return *this;

		Copy(other);
		return *this;
	}

	bool operator==(const EMO_Skeleton &rhs) const;

	inline bool operator!=(const EMO_Skeleton &rhs) const
	{
		return !(*this == rhs);
	}

	inline EMO_Bone &operator[](size_t n) { return bones[n]; }
	inline const EMO_Bone &operator[](size_t n) const { return bones[n]; }

	inline EMO_Bone &operator[](const std::string &bone_name)
	{
		EMO_Bone *b = GetBone(bone_name);
		if (!b)
		{
			throw std::out_of_range("EMO_Bone " + bone_name + " doesn't exist.");
		}

		return *b;
	}

	inline const EMO_Bone &operator[](const std::string &bone_name) const
	{
		const EMO_Bone *b = GetBone(bone_name);
		if (!b)
		{
			throw std::out_of_range("EMO_Bone " + bone_name + " doesn't exist.");
		}

		return *b;
	}

	inline const EMO_Skeleton operator+(const EMO_Bone &bone) const
	{
		EMO_Skeleton new_skl = *this;

		new_skl.AppendBone(bone);
		return new_skl;
	}

	inline EMO_Skeleton &operator+=(const EMO_Bone &bone)
	{
		this->AppendBone(bone);
		return *this;
	}

	inline std::vector<EMO_Bone>::iterator begin() { return bones.begin(); }
	inline std::vector<EMO_Bone>::iterator end() { return bones.end(); }

	inline std::vector<EMO_Bone>::const_iterator begin() const { return bones.begin(); }
	inline std::vector<EMO_Bone>::const_iterator end() const { return bones.end(); }
};



/********************************************************************************************
*									BoneSorter												*
********************************************************************************************/
class BoneSorter
{
private:
	const EMO_Skeleton *skl;

public:
	BoneSorter(const EMO_Skeleton *skl) : skl(skl) {}
	bool operator()(EMO_Bone * const &b1, EMO_Bone * const &b2) { return (skl->BoneToIndex(b1) < skl->BoneToIndex(b2)); }
};



}

#endif // __EMO_SKELETON_H__
