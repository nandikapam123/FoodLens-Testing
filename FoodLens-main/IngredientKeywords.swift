//
//  IngredientKeywords.swift
//

import SwiftUI
import Foundation
struct IngredientKeywords {
    
    static let nut_free: [String] = [
        "peanut", "almond", "walnut", "cashew", "hazelnut", "filbert", "pecan",
        "pistachio", "brazil nut", "macadamia nut", "pine nut", "pinyon", "pignolia",
        "chestnut", "beechnut", "butternut", "chinquapin nut", "ginkgo nut", "hickory nut",
        "lychee nut", "pili nut", "shea nut", "groundnut", "earth nut", "goober", "monkey nut",
        "beer nuts", "arachis oil", "mandelonas", "marzipan", "praline", "gianduja", "nougat",
        "pesto", "nut meat", "nut butter", "nut oil", "nut extract", "nut flour", "nut meal",
        "nut paste", "hydrolyzed plant protein", "hydrolyzed vegetable protein"
    ]
    
    static let dairy_free: [String] = [
        "milk", "whey", "casein", "caseinate", "lactose", "butter", "cream", "cheese",
        "curds", "ghee", "buttermilk", "yogurt", "kefir", "paneer", "koumiss", "lactalbumin",
        "lactoferrin", "lactoglobulin", "lactulose", "recident", "rennet casein",
        "hydrolyzed milk protein", "milk solids", "milk fat", "dry milk powder", "evaporated milk",
        "condensed milk", "sour cream", "custard", "pudding", "nougat", "diacetyl", "nisin",
        "starter distillate", "tagatose", "galactose", "lactitol", "sodium caseinate",
        "calcium caseinate", "iron caseinate", "magnesium caseinate", "potassium caseinate",
        "zinc caseinate", "ammonium caseinate"
    ]
    
    static let gluten_free: [String] = [
        "wheat", "barley", "rye", "triticale", "spelt", "kamut", "durum", "semolina",
        "farina", "farro", "emmer", "einkorn", "graham", "malt", "malt extract",
        "malt syrup", "malt flavoring", "malt vinegar", "brewer's yeast", "seitan",
        "bulgur", "couscous", "matzo", "atta", "maida", "panko", "roux",
        "hydrolyzed wheat protein", "modified wheat starch", "wheat germ", "wheat bran",
        "wheat berries", "dextrin", "caramel color", "vegetable protein", "hydrolyzed vegetable protein", "oats"
    ]
    
    static let veg: [String] = [
        "bovine", "fish", "porcine", "ovine", "caprine", "avian", "equine",
        "cervid", "piscine", "beef", "pork", "mutton", "lamb", "chevon", "veal",
        "venison", "lard", "tallow", "suet", "gelatin", "collagen", "rennet",
        "pepsin", "isinglass", "carmine", "cochineal", "castoreum", "l-cysteine",
        "bone meal", "meat meal", "stock", "broth", "albumin", "casein", "whey",
        "keratin", "elastin", "stearates", "stearic acid", "sodium tallowate"
    ]
    
    static let soy_free: [String] = [
        "soy", "soya", "soybean", "tofu", "tempeh", "miso", "edamame", "natto",
        "shoyu", "tamari", "teriyaki", "soy lecithin", "soy protein", "soy milk",
        "glycine max", "kinako", "koya dofu", "okara", "yuba", "bean curd",
        "hydrolyzed soy protein", "textured vegetable protein", "tvp", "soy albumin",
        "soy fiber", "soy flour", "soy grits", "soy nuts", "mono-diglyceride", "msg"
    ]
    
    static let shellfish_free: [String] = [
        "shrimp", "prawn", "crab", "lobster", "crayfish", "crawfish", "crawdad",
        "mollusk", "mussel", "clam", "oyster", "scallop", "snail", "escargot",
        "octopus", "squid", "calamari", "abalone", "barnacle", "krill", "cuttlefish",
        "periwinkle", "cockle", "sea urchin", "sea cucumber", "whelk", "limpet",
        "surimi", "glucosamine", "bouillabaisse", "cuttlefish ink", "fish sauce",
        "shrimp paste", "langoustine", "scampi", "tomalley", "coral"
    ]
    static let vegan: [String] = [
        "egg", "milk", "cheese", "butter", "honey", "gelatin", "whey", "casein",
        "beeswax", "shellac", "confectioner's glaze", "lanolin", "egg white", "egg yolk",
        "lysozyme", "albumin", "royal jelly", "propolis", "carmine", "cochineal",
        "castoreum", "isinglass", "l-cysteine", "tallow", "lard", "bovine", "fish", "porcine", "ovine", "caprine", "avian", "equine", "cervid", "piscine", "beef", "pork", "mutton", "lamb", "chevon", "veal", "venison", "lard", "tallow", "suet", "gelatin", "collagen", "rennet","pepsin", "isinglass", "carmine", "cochineal", "castoreum", "l-cysteine",
        "bone meal", "meat meal", "stock", "broth", "albumin", "casein", "whey",
        "keratin", "elastin", "stearates", "stearic acid", "sodium tallowate"
    ]
    
    static let vegetarian: [String] = [
        "bacon", "chicken", "beef", "pork", "fish", "gelatin", "lard"
    ]
    
    static let kosher: [String] = [
        "pork", "shellfish", "non-kosher meat", "non-kosher wine", "gelatin"
    ]
    
    static let halal: [String] = [
        "pork", "non-halal meat", "alcohol", "gelatin", "lard"
    ]
    
    
    // Premium-only (health-focused)
    static let preservatives_free: [String] = [
        "sulfite", "benzoate", "propionate", "sodium nitrate", "BHT"
    ]
    
    static let palm_oil_free: [String] = [
        "palm oil", "palm kernel oil", "hydrogenated palm"
    ]
    
    static let added_sugars_free: [String] = [
        "sugar", "high fructose corn syrup", "corn syrup", "honey", "agave syrup"
    ]
    
    // Optional helper function
    static func detectMatches(for category: IngredientCategory, in text: String) -> [String] {
        let lowerText = text.lowercased()
        return category.keywords.filter { lowerText.contains($0.lowercased()) }
    }
}


