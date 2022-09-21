import { Enum, EnumType } from "ts-jenum";

class App {
  private constructor() {}

  private static instance:App;

  static getApp() {
    if(this.instance === null) {
      this.instance === new App();
    }

    return this.instance;
  }
}

@Enum("app")
class EnumApp extends EnumType<EnumApp>() {
  
  static readonly instance = new EnumApp();

  private constructor(){
    super()
  }

}


function a() {
  const a = EnumApp()
  const b = EnumApp()

  console.log(a === b)
}

a()
