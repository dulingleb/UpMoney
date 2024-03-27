//
//  CoreDataStack + InitializeDataIfNeeded.swift
//  UpMoney
//
//  Created by Dulin Gleb on 19.3.24..
//

import Foundation
import CoreData
import UIKit

extension CoreDataStack {
    func initializeDataIfNeeded() {
        initializeCurrencies()
        initializeAccount()
        
        //print("Data initialized successfully")
    }
    
    func initializeCurrencies() {
        struct CurrencyData {
            var code: String
            var name: String
            var symbol: String
        }
        
        let currencies = getAllCurrencies()
        guard currencies.count == 0 else {
            //print("Currencies have already initialized")
            return
        }
        
        let currenciesData: [CurrencyData] = [
            CurrencyData(code: "AED", name: "United Arab Emirates Dirham", symbol: "د.إ"),
            CurrencyData(code: "AFN", name: "Afghan Afghani", symbol: "؋"),
            CurrencyData(code: "ALL", name: "Albanian Lek", symbol: "L"),
            CurrencyData(code: "AMD", name: "Armenian Dram", symbol: "֏"),
            CurrencyData(code: "ANG", name: "Netherlands Antillean Guilder", symbol: "ƒ"),
            CurrencyData(code: "AOA", name: "Angolan Kwanza", symbol: "Kz"),
            CurrencyData(code: "ARS", name: "Argentine Peso", symbol: "$"),
            CurrencyData(code: "AUD", name: "Australian Dollar", symbol: "$"),
            CurrencyData(code: "AWG", name: "Aruban Florin", symbol: "ƒ"),
            CurrencyData(code: "AZN", name: "Azerbaijani Manat", symbol: "₼"),
            CurrencyData(code: "BAM", name: "Bosnia-Herzegovina Convertible Mark", symbol: "KM"),
            CurrencyData(code: "BBD", name: "Barbadian Dollar", symbol: "$"),
            CurrencyData(code: "BDT", name: "Bangladeshi Taka", symbol: "৳"),
            CurrencyData(code: "BGN", name: "Bulgarian Lev", symbol: "лв"),
            CurrencyData(code: "BHD", name: "Bahraini Dinar", symbol: ".د.ب"),
            CurrencyData(code: "BIF", name: "Burundian Franc", symbol: "FBu"),
            CurrencyData(code: "BMD", name: "Bermudian Dollar", symbol: "$"),
            CurrencyData(code: "BND", name: "Brunei Dollar", symbol: "$"),
            CurrencyData(code: "BOB", name: "Bolivian Boliviano", symbol: "Bs."),
            CurrencyData(code: "BRL", name: "Brazilian Real", symbol: "R$"),
            CurrencyData(code: "BSD", name: "Bahamian Dollar", symbol: "$"),
            CurrencyData(code: "BTN", name: "Bhutanese Ngultrum", symbol: "Nu."),
            CurrencyData(code: "BWP", name: "Botswanan Pula", symbol: "P"),
            CurrencyData(code: "BYN", name: "Belarusian Ruble", symbol: "Br"),
            CurrencyData(code: "BZD", name: "Belize Dollar", symbol: "BZ$"),
            CurrencyData(code: "CAD", name: "Canadian Dollar", symbol: "$"),
            CurrencyData(code: "CDF", name: "Congolese Franc", symbol: "FC"),
            CurrencyData(code: "CHF", name: "Swiss Franc", symbol: "CHF"),
            CurrencyData(code: "CLP", name: "Chilean Peso", symbol: "$"),
            CurrencyData(code: "CNY", name: "Chinese Yuan", symbol: "¥"),
            CurrencyData(code: "COP", name: "Colombian Peso", symbol: "$"),
            CurrencyData(code: "CRC", name: "Costa Rican Colón", symbol: "₡"),
            CurrencyData(code: "CUP", name: "Cuban Peso", symbol: "₱"),
            CurrencyData(code: "CVE", name: "Cape Verdean Escudo", symbol: "$"),
            CurrencyData(code: "CZK", name: "Czech Republic Koruna", symbol: "Kč"),
            CurrencyData(code: "DJF", name: "Djiboutian Franc", symbol: "Fdj"),
            CurrencyData(code: "DKK", name: "Danish Krone", symbol: "kr"),
            CurrencyData(code: "DOP", name: "Dominican Peso", symbol: "RD$"),
            CurrencyData(code: "DZD", name: "Algerian Dinar", symbol: "د.ج"),
            CurrencyData(code: "EGP", name: "Egyptian Pound", symbol: "£"),
            CurrencyData(code: "ERN", name: "Eritrean Nakfa", symbol: "Nfk"),
            CurrencyData(code: "ETB", name: "Ethiopian Birr", symbol: "Br"),
            CurrencyData(code: "EUR", name: "Euro", symbol: "€"),
            CurrencyData(code: "FJD", name: "Fijian Dollar", symbol: "$"),
            CurrencyData(code: "FKP", name: "Falkland Islands Pound", symbol: "£"),
            CurrencyData(code: "FOK", name: "Faroese Króna", symbol: "kr"),
            CurrencyData(code: "GBP", name: "British Pound Sterling", symbol: "£"),
            CurrencyData(code: "GEL", name: "Georgian Lari", symbol: "₾"),
            CurrencyData(code: "GGP", name: "Guernsey Pound", symbol: "£"),
            CurrencyData(code: "GHS", name: "Ghanaian Cedi", symbol: "₵"),
            CurrencyData(code: "GIP", name: "Gibraltar Pound", symbol: "£"),
            CurrencyData(code: "GMD", name: "Gambian Dalasi", symbol: "D"),
            CurrencyData(code: "GNF", name: "Guinean Franc", symbol: "FG"),
            CurrencyData(code: "GTQ", name: "Guatemalan Quetzal", symbol: "Q"),
            CurrencyData(code: "GYD", name: "Guyanaese Dollar", symbol: "$"),
            CurrencyData(code: "HKD", name: "Hong Kong Dollar", symbol: "$"),
            CurrencyData(code: "HNL", name: "Honduran Lempira", symbol: "L"),
            CurrencyData(code: "HRK", name: "Croatian Kuna", symbol: "kn"),
            CurrencyData(code: "HTG", name: "Haitian Gourde", symbol: "G"),
            CurrencyData(code: "HUF", name: "Hungarian Forint", symbol: "Ft"),
            CurrencyData(code: "IDR", name: "Indonesian Rupiah", symbol: "Rp"),
            CurrencyData(code: "ILS", name: "Israeli New Sheqel", symbol: "₪"),
            CurrencyData(code: "IMP", name: "Isle of Man Pound", symbol: "£"),
            CurrencyData(code: "INR", name: "Indian Rupee", symbol: "₹"),
            CurrencyData(code: "IQD", name: "Iraqi Dinar", symbol: "ع.د"),
            CurrencyData(code: "IRR", name: "Iranian Rial", symbol: "﷼"),
            CurrencyData(code: "ISK", name: "Icelandic Króna", symbol: "kr"),
            CurrencyData(code: "JEP", name: "Jersey Pound", symbol: "£"),
            CurrencyData(code: "JMD", name: "Jamaican Dollar", symbol: "J$"),
            CurrencyData(code: "JOD", name: "Jordanian Dinar", symbol: "JD"),
            CurrencyData(code: "JPY", name: "Japanese Yen", symbol: "¥"),
            CurrencyData(code: "KES", name: "Kenyan Shilling", symbol: "KSh"),
            CurrencyData(code: "KGS", name: "Kyrgystani Som", symbol: "с"),
            CurrencyData(code: "KHR", name: "Cambodian Riel", symbol: "៛"),
            CurrencyData(code: "KID", name: "Kiribati Dollar", symbol: "$"),
            CurrencyData(code: "KMF", name: "Comorian Franc", symbol: "CF"),
            CurrencyData(code: "KRW", name: "South Korean Won", symbol: "₩"),
            CurrencyData(code: "KWD", name: "Kuwaiti Dinar", symbol: "د.ك"),
            CurrencyData(code: "KYD", name: "Cayman Islands Dollar", symbol: "$"),
            CurrencyData(code: "KZT", name: "Kazakhstani Tenge", symbol: "₸"),
            CurrencyData(code: "LAK", name: "Laotian Kip", symbol: "₭"),
            CurrencyData(code: "LBP", name: "Lebanese Pound", symbol: "£"),
            CurrencyData(code: "LKR", name: "Sri Lankan Rupee", symbol: "Rs"),
            CurrencyData(code: "LRD", name: "Liberian Dollar", symbol: "$"),
            CurrencyData(code: "LSL", name: "Lesotho Loti", symbol: "L"),
            CurrencyData(code: "LYD", name: "Libyan Dinar", symbol: "LD"),
            CurrencyData(code: "MAD", name: "Moroccan Dirham", symbol: "د.م."),
            CurrencyData(code: "MDL", name: "Moldovan Leu", symbol: "L"),
            CurrencyData(code: "MGA", name: "Malagasy Ariary", symbol: "Ar"),
            CurrencyData(code: "MKD", name: "Macedonian Denar", symbol: "ден"),
            CurrencyData(code: "MMK", name: "Myanmar Kyat", symbol: "K"),
            CurrencyData(code: "MNT", name: "Mongolian Tugrik", symbol: "₮"),
            CurrencyData(code: "MOP", name: "Macanese Pataca", symbol: "P"),
            CurrencyData(code: "MRU", name: "Mauritanian Ouguiya", symbol: "UM"),
            CurrencyData(code: "MUR", name: "Mauritian Rupee", symbol: "₨"),
            CurrencyData(code: "MVR", name: "Maldivian Rufiyaa", symbol: "Rf"),
            CurrencyData(code: "MWK", name: "Malawian Kwacha", symbol: "MK"),
            CurrencyData(code: "MXN", name: "Mexican Peso", symbol: "$"),
            CurrencyData(code: "MYR", name: "Malaysian Ringgit", symbol: "RM"),
            CurrencyData(code: "MZN", name: "Mozambican Metical", symbol: "MT"),
            CurrencyData(code: "NAD", name: "Namibian Dollar", symbol: "$"),
            CurrencyData(code: "NGN", name: "Nigerian Naira", symbol: "₦"),
            CurrencyData(code: "NIO", name: "Nicaraguan Córdoba", symbol: "C$"),
            CurrencyData(code: "NOK", name: "Norwegian Krone", symbol: "kr"),
            CurrencyData(code: "NPR", name: "Nepalese Rupee", symbol: "Rs"),
            CurrencyData(code: "NZD", name: "New Zealand Dollar", symbol: "$"),
            CurrencyData(code: "OMR", name: "Omani Rial", symbol: "ر.ع."),
            CurrencyData(code: "PAB", name: "Panamanian Balboa", symbol: "B/."),
            CurrencyData(code: "PEN", name: "Peruvian Nuevo Sol", symbol: "S/"),
            CurrencyData(code: "PGK", name: "Papua New Guinean Kina", symbol: "K"),
            CurrencyData(code: "PHP", name: "Philippine Peso", symbol: "₱"),
            CurrencyData(code: "PKR", name: "Pakistani Rupee", symbol: "₨"),
            CurrencyData(code: "PLN", name: "Polish Złoty", symbol: "zł"),
            CurrencyData(code: "PYG", name: "Paraguayan Guarani", symbol: "₲"),
            CurrencyData(code: "QAR", name: "Qatari Rial", symbol: "ر.ق"),
            CurrencyData(code: "RON", name: "Romanian Leu", symbol: "lei"),
            CurrencyData(code: "RSD", name: "Serbian Dinar", symbol: "дин."),
            CurrencyData(code: "RUB", name: "Russian Ruble", symbol: "₽"),
            CurrencyData(code: "RWF", name: "Rwandan Franc", symbol: "FRw"),
            CurrencyData(code: "SAR", name: "Saudi Riyal", symbol: "ر.س"),
            CurrencyData(code: "SBD", name: "Solomon Islands Dollar", symbol: "$"),
            CurrencyData(code: "SCR", name: "Seychellois Rupee", symbol: "₨"),
            CurrencyData(code: "SDG", name: "Sudanese Pound", symbol: "ج.س."),
            CurrencyData(code: "SEK", name: "Swedish Krona", symbol: "kr"),
            CurrencyData(code: "SGD", name: "Singapore Dollar", symbol: "$"),
            CurrencyData(code: "SHP", name: "Saint Helena Pound", symbol: "£"),
            CurrencyData(code: "SLL", name: "Sierra Leonean Leone", symbol: "Le"),
            CurrencyData(code: "SOS", name: "Somali Shilling", symbol: "Sh"),
            CurrencyData(code: "SRD", name: "Surinamese Dollar", symbol: "$"),
            CurrencyData(code: "SSP", name: "South Sudanese Pound", symbol: "£"),
            CurrencyData(code: "STN", name: "São Tomé and Príncipe Dobra", symbol: "Db"),
            CurrencyData(code: "SYP", name: "Syrian Pound", symbol: "£S"),
            CurrencyData(code: "SZL", name: "Swazi Lilangeni", symbol: "L"),
            CurrencyData(code: "THB", name: "Thai Baht", symbol: "฿"),
            CurrencyData(code: "TJS", name: "Tajikistani Somoni", symbol: "ЅМ"),
            CurrencyData(code: "TMT", name: "Turkmenistani Manat", symbol: "T"),
            CurrencyData(code: "TND", name: "Tunisian Dinar", symbol: "د.ت"),
            CurrencyData(code: "TOP", name: "Tongan Pa'anga", symbol: "T$"),
            CurrencyData(code: "TRY", name: "Turkish Lira", symbol: "₺"),
            CurrencyData(code: "TTD", name: "Trinidad and Tobago Dollar", symbol: "TT$"),
            CurrencyData(code: "TVD", name: "Tuvaluan Dollar", symbol: "$"),
            CurrencyData(code: "TWD", name: "New Taiwan Dollar", symbol: "NT$"),
            CurrencyData(code: "TZS", name: "Tanzanian Shilling", symbol: "Sh"),
            CurrencyData(code: "UAH", name: "Ukrainian Hryvnia", symbol: "₴"),
            CurrencyData(code: "UGX", name: "Ugandan Shilling", symbol: "UGX"),
            CurrencyData(code: "USD", name: "United States Dollar", symbol: "$"),
            CurrencyData(code: "UYU", name: "Uruguayan Peso", symbol: "$"),
            CurrencyData(code: "UZS", name: "Uzbekistan Som", symbol: "so'm"),
            CurrencyData(code: "VES", name: "Venezuelan Bolívar", symbol: "Bs."),
            CurrencyData(code: "VND", name: "Vietnamese Đồng", symbol: "₫"),
            CurrencyData(code: "VUV", name: "Vanuatu Vatu", symbol: "VT"),
            CurrencyData(code: "WST", name: "Samoan Tala", symbol: "T"),
            CurrencyData(code: "XAF", name: "Central African CFA Franc", symbol: "FCFA"),
            CurrencyData(code: "XCD", name: "Eastern Caribbean Dollar", symbol: "$"),
            CurrencyData(code: "XDR", name: "Special Drawing Rights", symbol: "XDR"),
            CurrencyData(code: "XOF", name: "West African CFA Franc", symbol: "CFA"),
            CurrencyData(code: "XPF", name: "CFP Franc", symbol: "₣"),
            CurrencyData(code: "YER", name: "Yemeni Rial", symbol: "﷼"),
            CurrencyData(code: "ZAR", name: "South African Rand", symbol: "R"),
            CurrencyData(code: "ZMW", name: "Zambian Kwacha", symbol: "ZK"),
            CurrencyData(code: "ZWL", name: "Zimbabwean Dollar", symbol: "$")
        ]
        
        for currency in currenciesData {
            addCurrency(name: currency.name, code: currency.code, symbol: currency.symbol)
        }
    }
    
    func initializeAccount() {
        let accounts = getAllAccounts()
        
        guard accounts.count == 0 else {
            // print("Accounts have already initialized")
            return
        }
        
        guard let currency: Currency = getCurrencyByCode("USD") else {
            print("Can not add account becouase currency was not founded")
            return
        }
        
        addAccount(
            name: NSLocalizedString("Cash", comment: ""),
            icon: .wallet,
            iconColor: .systemOrange,
            startBalance: 0.0,
            currency: currency
        )
    }
    
    func initializeTransactionCategories() {
        let categories = getAllTransactionCategories()
        
        guard categories.count == 0 else {
            return
        }
        
        struct TransactionCategoryStruct {
            var name: String
            var icon: Icon
            var color: UIColor
            var type: TransactionType
        }
        
        let initCategories: [TransactionCategoryStruct] = [
            TransactionCategoryStruct(name: "Entertaiment", icon: .popcorn, color: .systemOrange, type: .expense)
        ]
        
        initCategories.enumerated().forEach { (index, category) in
            addTransactionCategory(name: category.name, icon: category.icon, iconColor: category.color, type: category.type, pos: Int16(index))
        }
    }
    
    
}
