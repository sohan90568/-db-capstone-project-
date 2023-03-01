class Bird {
    useWings() {
        console.log("Flying!")
    }
}
class Eagle extends Bird {
    useWings() {
        super.useWings()
        console.log("Barely flapping!")
    }
}
var sohan={}

sohan.it="IT";
sohan.software="Software";

var sohann={movement:3.0,socialskills:3.0}

console.log(sohan,sohann);

export default function addTwo(a, b) {
    console.log(a + b);
}