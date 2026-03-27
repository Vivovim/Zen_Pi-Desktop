//
//  EntryService.swift
//  Zen Pi
//
//  Created by Nick Giarraputo on 1/11/25.
//

import Foundation

struct Entry: Codable {
    let DOY: String
    let entry: String
    let datex: String
}

class EntryService {
    
    static let shared = EntryService()
    
    ///******************************
    /// Get the entry String
    ///******************************
    func getEntryString(doy: Int, completion: @escaping (String?) -> Void) {
        // Usage Example
        fetchDataFromServer(doy: doy) { result in
            if let result = result {
                print("JSON Response: \(result[0].entry)")
                completion(result[0].entry)
            } else {
                print("Failed to fetch or parse data.")
                completion(nil)
            }
        }
    }
    
    ///******************************
    /// Get data from server
    ///******************************
    func fetchDataFromServer(doy: Int, completion: @escaping ([Entry]?) -> Void) {
        // The URL of the endpoint
        guard let url = URL(string: "https://www.zenpi.app/DO.php") else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        // Create the URL request
        var request = URLRequest(url: url)
        request.httpMethod = "POST" // Adjust the method if needed
        
        // Parameters to send in the request body
        let parameters: [String: Any] = [
            "doy": doy
        ]

        // Convert parameters to form-encoded data
        let parameterArray = parameters.map { "\($0.key)=\($0.value)" }
        let formEncodedData = parameterArray.joined(separator: "&").data(using: .utf8)

        // Set the form-encoded data as the body
        request.httpBody = formEncodedData
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        
        // Start the URL session task
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle any errors
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            // Check if data exists
            guard let data = data else {
                print("No data returned")
                completion(nil)
                return
            }
            
            // Debug print the raw data
            if let debugString = String(data: data, encoding: .ascii) {
                print("Raw response: \(debugString)")
            }
            
            // Decode JSON using JSONDecoder
            do {
                let decodedData = try JSONDecoder().decode([Entry].self, from: data)
                completion(decodedData) // Return the decoded array
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume() // Don't forget to start the task
    }
}
