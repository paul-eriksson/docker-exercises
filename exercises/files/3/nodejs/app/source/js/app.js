class Hal {

    constructor(response) {
        this.response = response.split("")
    }

    addMessage(msg) {
        document.getElementById('message').innerHTML += msg
    }

    delayMessage(msg) {
        return new Promise((resolve, reject) => {
            setTimeout( () => {this.addMessage(msg); resolve()}, 200+Math.random()*300 )
        })
    }

    hello() {
        document.getElementById('message').innerHTML = ""

        this.response.reduce((previous, current, index, array) => {
            return previous
            .then(()=>{return this.delayMessage(array[index])})
        }, Promise.resolve())
    }
}

function init() {
    let hal = new Hal("Hello Dave...")
    hal.hello()
}
