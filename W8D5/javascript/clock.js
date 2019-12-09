class Clock {
  constructor() {
    // 1. Create a Date object.
    this.date = new Date(); 
    // 2. Store the hours, minutes, and seconds.
    this.hour = this.date.getHours();
    this.minutes = this.date.getMinutes();
    this.seconds = this.date.getSeconds();
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    let time;
    if(this.minutes < 10){
      time = `${this.hour}:0${this.minutes}:${this.seconds}`;
    }else{
      time = `${this.hour}:${this.minutes}:${this.seconds}`;
    }
    // Use console.log to print it.
    console.log(time);
  }

  _tick() {
    // 1. Increment the time by one second.
    this.secondsincrement();
    // 2. Call printTime.
    this.printTime();
  }

  secondsincrement(){
    this.seconds++;
    if(this.seconds === 60){
      this.seconds = 0;
      this.minutesincrement();
    }
  }
  
  minutesincrement(){
    this.minutes++;
    if(this.minutes === 60){
      this.minutes = 0;
      this.hoursincrement();
    }
  }

  hoursincrement(){
    this.hour++;
    if(this.hour === 24){
      this.hour = 0;
    }
  }

}

const clock = new Clock();
