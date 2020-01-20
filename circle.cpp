#include "circle.h"


Circle::Circle(QQuickItem *parent) : QQuickPaintedItem(parent), m_angle(0)
{

}

void Circle::paint(QPainter *painter)
{
        QColor inner("#4d5254");
        QColor border("#e2574c");

        QBrush  brush(inner);
        QBrush  brushActive(border);
        QBrush  brushNonActive(inner);

        painter->setPen(Qt::NoPen);
        painter->setRenderHints(QPainter::Antialiasing, true);

        painter->setBrush(brushNonActive);
        painter->drawEllipse(boundingRect().adjusted(1,1,-1,-1));

        painter->setBrush(brushActive);
        painter->drawPie(boundingRect().adjusted(1,1,-1,-1), 90*16,m_angle*16);

        painter->setBrush(brush);
        painter->drawEllipse(boundingRect().adjusted(10,10,-10,-10));
}

double Circle::getAngle() const
{
    return m_angle;
}

void Circle::setAngle(double angle)
{
    if (qFuzzyCompare(m_angle, angle))
        return;
    m_angle = angle;

    if(m_angle<=-360) m_angle=0;

    update();

    emit angleChanged(m_angle);
}
