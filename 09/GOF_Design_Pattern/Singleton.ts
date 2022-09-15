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


function a() {
  const a = App.getApp()
  const b = App.getApp()

  console.log(a === b)
}

a()