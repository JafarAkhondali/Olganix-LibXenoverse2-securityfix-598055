/****************************************************************************
**
** Copyright (C) 2014 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the QtGui module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL21$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia. For licensing terms and
** conditions see http://qt.digia.com/licensing. For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 or version 3 as published by the Free
** Software Foundation and appearing in the file LICENSE.LGPLv21 and
** LICENSE.LGPLv3 included in the packaging of this file. Please review the
** following information to ensure the GNU Lesser General Public License
** requirements will be met: https://www.gnu.org/licenses/lgpl.html and
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights. These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef QSTYLEHINTS_H
#define QSTYLEHINTS_H

#include <QtCore/qobject.h>

QT_BEGIN_NAMESPACE


class QPlatformIntegration;
class QStyleHintsPrivate;

class Q_GUI_EXPORT QStyleHints : public QObject
{
    Q_OBJECT
    Q_DECLARE_PRIVATE(QStyleHints)
public:
    void setMouseDoubleClickInterval(int mouseDoubleClickInterval);
    int mouseDoubleClickInterval() const;
    int mousePressAndHoldInterval() const;
    void setStartDragDistance(int startDragDistance);
    int startDragDistance() const;
    void setStartDragTime(int startDragTime);
    int startDragTime() const;
    int startDragVelocity() const;
    void setKeyboardInputInterval(int keyboardInputInterval);
    int keyboardInputInterval() const;
    int keyboardAutoRepeatRate() const;
    void setCursorFlashTime(int cursorFlashTime);
    int cursorFlashTime() const;
    bool showIsFullScreen() const;
    int passwordMaskDelay() const;
    QChar passwordMaskCharacter() const;
    qreal fontSmoothingGamma() const;
    bool useRtlExtensions() const;
    bool setFocusOnTouchRelease() const;

private:
    friend class QGuiApplication;
    QStyleHints();
};

QT_END_NAMESPACE

#endif
