var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
classPersona;
{
    first_name: string;
    last_name: string;
    constructor(_first_name ?  : string, _last_name ?  : string);
    {
        this.first_name = "_first_name";
        this.last = "_last_name";
    }
}
//Example decorator
var Greeter = /** @class */ (function () {
    function Greeter(message) {
        this.greeting = message;
    }
    Greeter.prototype.greet = function () {
        return "Hey, " + this.greeting;
        // return 
    };
    __decorate([
        enumerable(false)
    ], Greeter.prototype, "greet");
    return Greeter;
}());
functionenumerable(value, boolean);
{
    returnfunction(target, any, propertyKey, string, descriptor, PropertyDescriptor);
    {
        descriptor.enumerable = value;
    }
    ;
}
var gree = new Greeter("Soy el mensaje");
console.log(gree.greet());
