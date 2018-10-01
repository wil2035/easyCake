classPersona {

  first_name:string;
  last_name:string;
  
  constructor(_first_name?:string, _last_name?:string) {
    this.first_name = "_first_name";
    this.last = "_last_name";
   
  }
}

//Example decorator

class Greeter {

   greeting: string;
   constructor(message: string) {
       this.greeting = message;
   }

   @enumerable(false)
   greet() {
        return"Hey, " + this.greeting;
       // return 
   }
}

functionenumerable(value: boolean) {
   returnfunction (target: any, propertyKey: string, descriptor: PropertyDescriptor) {
        descriptor.enumerable  = value;
   };
}

let gree = new Greeter("Soy el mensaje");

console.log(gree.greet());