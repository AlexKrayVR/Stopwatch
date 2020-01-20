#ifndef CIRCLE_H
#define CIRCLE_H

#include <QObject>
#include<QColor>
#include<QBrush>
#include<QString>
#include<QPainter>
#include<QPen>
#include<QQuickPaintedItem>

class Circle : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(double angle READ getAngle WRITE setAngle NOTIFY angleChanged)

public:

    explicit Circle(QQuickItem *parent = nullptr);

    void paint(QPainter *painter) override;

    double m_angle;

    double getAngle() const;

public slots:

    void setAngle(double angle);

signals:
    void angleChanged(double angle);
};

#endif // CIRCLE_H
