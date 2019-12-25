#ifndef STOPWATCH_H
#define STOPWATCH_H

#include <QObject>
#include<QTimer>
#include<QTime>

class StopWatch : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString time READ getTime NOTIFY timeChanged)
public:
    StopWatch(QObject *parent = nullptr);
    ~StopWatch();

    Q_INVOKABLE void on_start_button_clicked();
    Q_INVOKABLE void on_stop_button_clicked();

    QString getTime();

signals:
    void timeChanged();

private slots:
    void update();

private:
    //value to display in QML
    QString m_time;

    int _milliseconds;
    int _milliseconds_stop;
    bool check_stop;
    bool check_start;

    QTimer my_timer_current;
    QTime current_time;
    QTime last_time;
};
#endif // STOPWATCH_H
