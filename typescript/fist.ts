console.log("Mi mensaje");

var full_nombre:string = "wilmer";

var age:number = 27;

var developer:boolean = true;

var skills:Array<String> = ['JavaScript','TypeScript','Angular'];

var numberArray:number[] = [123,123,1213,1231];

/*enum ROLE {Employee, Manager, Admin, Developer };

var role:Role = Role.Employee;


functionhello():void {
}

functionsetName(name:string):void{
}

functionsetName(name:string, surName:string ):string {
   return "Hola " + name + surName;
}

// Teniendo la misma función pero con la variable fuera de ella                          
var variableExterna:string = "Uriel";

functionsetName(name:string):string{
   // Accedemos a la variable externa usando "this" this.variableExterna = name; 
   return"Hola" + name;
}
*/

getSaludo():string{
    let emojis = '(⌐■_■)';
    return`Saludos 
        ${this.last_name}, ${this.first_name}
        Le enviamos un saludo desde la consola!
        ${emojis}
    `;
}


