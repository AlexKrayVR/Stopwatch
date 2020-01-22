#include "circle.h"


Circle::Circle(QQuickItem *parent) : QQuickPaintedItem(parent), m_angle(0)
{

}

void Circle::paint(QPainter *painter)
{
    painter->setPen(Qt::NoPen);
    painter->setRenderHints(QPainter::Antialiasing, true);

    //base color
    QColor base("#4d5254");
    QBrush  brushBase(base);

    //moving stroke color
    QColor stroke("#e2574c");
    QBrush  brushStroke(stroke);

    //static stroke color
    //QBrush  brushStrokeStatic(Qt::green);
    //painter->setBrush(brushStrokeStatic);
    //painter->drawEllipse(boundingRect().adjusted(1,1,-1,-1));

    painter->setBrush(brushStroke);
    painter->drawPie(boundingRect().adjusted(1,1,-1,-1), 90*16,m_angle*16);

    painter->setBrush(brushBase);
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
