

enum Route: String {

    case films = "/films"
    case people = "/people"
    case locations = "/locations"
    case vehicles = "/vehicles"
    
    func url() -> String{
        return Constants.baseURL + self.rawValue
    }
}
