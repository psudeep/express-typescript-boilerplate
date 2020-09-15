export class Routes {

  public routes(app): void {
    app.route("/").get((req, res) => {
      return res.send("welcome to express typescript boiler plate")
    });
  }
}
