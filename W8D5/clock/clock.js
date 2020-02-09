class Clock {
    constructor() {
        // 1. Create a Date object.
        // 2. Store the hours, minutes, and seconds.
        // 3. Call printTime.
        // 4. Schedule the tick at 1 second intervals.
        let currentDate = new Date();
        this.hours = currentDate.getHours();
        this.minutes = currentDate.getMinutes();
        this.seconds = currentDate.getSeconds();
        this.printTime();
    }

    printTime() {
        // Format the time in HH:MM:SS
        // Use console.log to print it.
        console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
    }

    _tick() {
        // 1. Increment the time by one second.
        // 2. Call printTime.
        this.seconds++;
        this.printTime();
    }
}

const clock = new Clock();
for(let i = 1; i < 5; i++) {
setTimeout(function() {
    clock._tick();
}, i * 1000);
}
