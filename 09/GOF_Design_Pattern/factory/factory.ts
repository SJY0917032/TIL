class OrderShip { 
  _name: string
  _email: string

  
  protected constructor(name: string, email:string){
    this._name = name;
    this._email = email;
    
    Object.freeze(this)
  }


  get name(): string {
    return this._name
  }

  get email(): string {
    return this._email
  }

  private create(name:string, email: string){
    this.validate(name, email)
    this.prepareFor(name)
    const Ship = new OrderShip(name, email)
    this.sendToEmail(email)
  }
  
  private validate(name:string, email: string): void {
    if(name === null || name === undefined) {
      throw new Error("이름을 지어주세요")
    }
    if(email === null || email === undefined) {
      throw new Error('이메일을 입력하세요.')
    }
  }

  private prepareFor(name: string): void {
    console.log(`${name}을 만드는중입니다.`)
  }

  private sendToEmail(email: string): void {
    console.log(`${email}님 다 만들어졌어요`)
  }

}