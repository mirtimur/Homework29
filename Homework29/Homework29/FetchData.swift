import Foundation

func fetchData() {
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
    let session = URLSession.shared
    
    let task = session.dataTask(with: url, completionHandler: { data, response, error in
        guard error == nil else {
            print("Ошибка: \(error!.localizedDescription)")
            
            return
        }
        
        guard let responseData = data else {
            print("Нет данных")
            
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: responseData, options: [])
            print(json)
        }
        catch {
            print("Ошибка разбора данных как JSON: \(error.localizedDescription)")
        }
    })
    
    task.resume()
}
