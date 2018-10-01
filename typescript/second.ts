let name: string = `Javier Ruiz`;
let age: number = 28;
let sentence: string = `Hola, mi nombre es ${ name }.
Este año voy a cumplir ${ age + 1 } años.`;
// Esto sería equivalente a
let sentence: string = "Hola, mi nombre es " + name + ".\n\n" + "Este año voy a cumplir " + (age + 1) + " años.";

let arrayNumber: number[] = [1, 2, 3];
let arrayString: string[] = ['1', '2', '3'];
// Ó bien de la siguiente manera
let arrayNumber: Array<number> = [1, 2, 3];
let arrayString: Array<string> = ['1', '2', '3'];
let arrayMixed: any[] = [2, '5', 3];

// Declaramos el tuple
let array: [string, number];
// Inicializamos Correctamente
array = ['Hola', 2];
// Inicializamos Incorrectamente
array = [2, 'hola']; // Regresará un error

/*// Roles
enum Roles { Admin, User}; // Admin = 0, User = 1
let user: Roles = Roles.Admin;

// Roles
enum Roles { Admin = 1, User};
let user: Roles = Roles.Admin; // Ahora User será 2
// Modificando todos
enum Roles { Admin = 1, User = 3, Guest = 0 };
*/
// Any
let list: any[] = [1, '2', true];
let user: Object = {
    name: "Tu nombre",
    age: 29,
    havePets: true
};
console.log(list[0], user.name);

// Interface
interface Puppy {
    name: string,
    age?: string
};
const puppy: Puppy = {
   name: "Mascota"
};