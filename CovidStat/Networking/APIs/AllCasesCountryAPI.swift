//
// AllCasesCountryAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



open class AllCasesCountryAPI {
    /**
     Returns all cases by case type for a country
     
     - parameter country: (path) country slug 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getTotalCountryCases(country: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: [TotalCountryCases]?,_ error: Error?) -> Void)) {
        getTotalCountryCasesWithRequestBuilder(country: country).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Returns all cases by case type for a country
     - GET /total/country/{country}
     - parameter country: (path) country slug 
     - returns: RequestBuilder<[TotalCountryCases]> 
     */
    open class func getTotalCountryCasesWithRequestBuilder(country: String) -> RequestBuilder<[TotalCountryCases]> {
        var path = "/total/country/{country}"
        let countryPreEscape = "\(APIHelper.mapValueToPathItem(country))"
        let countryPostEscape = countryPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{country}", with: countryPostEscape, options: .literal, range: nil)
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<[TotalCountryCases]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
