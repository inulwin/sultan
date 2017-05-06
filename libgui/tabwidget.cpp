/*
 * tabview.cpp
 * Copyright 2017 - ~, Apin <apin.klas@gmail.com>
 *
 * This file is part of Turbin.
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program. If not, see <http://www.gnu.org/licenses/>.
 */
#include "tabwidget.h"
#include <QLabel>
#include <QVBoxLayout>
#include <QPixmap>

using namespace LibGUI;

TabWidget::TabWidget(QWidget *parent):
    QTabWidget(parent)
{
    auto lay = new QVBoxLayout(this);
    mLabel = new QLabel();
    QPixmap px(QLatin1String(":/images/icon_512.png"));
    mLabel->setPixmap(px);
    mLabel->setAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
    lay->addWidget(mLabel);
    setLayout(lay);
}

void TabWidget::tbnAddTab(QWidget *widget, const QString &name)
{
    if(mLabel->isVisible())
        mLabel->setVisible(false);
    addTab(widget, name);
}

void TabWidget::tbnRemoveTab(int index)
{
    removeTab(index);
    if(count() == 0)
        mLabel->setVisible(true);
}

