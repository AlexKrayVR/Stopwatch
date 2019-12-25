#include "stopwatch.h"


StopWatch::StopWatch(QObject *parent):QObject(parent),m_time(QTime::fromMSecsSinceStartOfDay(0).toString("mm:ss:zzz")),
    _milliseconds(0), _milliseconds_stop(0), check_stop(false), check_start(false)
{
    current_time.setHMS(0,0,0);
    last_time.setHMS(0,0,0);
    connect(&my_timer_current, SIGNAL(timeout()),this,SLOT(update()));
}

StopWatch::~StopWatch()
{

}

QString StopWatch::getTime()
{
    return m_time;
}


void StopWatch::update()
{
    emit timeChanged();
    last_time=QTime::currentTime();
    if(check_stop){
        _milliseconds=last_time.msecsSinceStartOfDay()-current_time.msecsSinceStartOfDay()+_milliseconds_stop;
        m_time=QTime::fromMSecsSinceStartOfDay(_milliseconds).toString("mm:ss:zzz");
    }
    else{
        _milliseconds=last_time.msecsSinceStartOfDay()-current_time.msecsSinceStartOfDay();
        m_time=QTime::fromMSecsSinceStartOfDay(_milliseconds).toString("mm:ss:zzz");
    }
}

// pressing resets the timer if he is active
// if the stop button was pressed, it continues from the current moment
void StopWatch::on_start_button_clicked()
{
    if(check_start){
        _milliseconds_stop=0;
    }
    check_start=true;
    my_timer_current.start();
    current_time=QTime::currentTime();
}

// pressing stops the timers
// pressing again resets the timer
void StopWatch::on_stop_button_clicked()
{
    check_start=false;
    check_stop=true;
    if(my_timer_current.isActive()){
        my_timer_current.stop();
        _milliseconds_stop=_milliseconds;
    }
    else{
        check_stop=false;
        current_time.setHMS(0,0,0);
        last_time.setHMS(0,0,0);
        _milliseconds_stop=0;
        m_time=QTime::fromMSecsSinceStartOfDay(0).toString("mm:ss:zzz");
        emit timeChanged();
    }
}
