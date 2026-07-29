//
//  MapData.swift
//

import Foundation
import CoreLocation
struct PantryLocation: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let address: String
    let hours: String
    let coordinate: CLLocationCoordinate2D
}
let pantryLocations: [PantryLocation] = [
    PantryLocation(
        name: "The Caring Place",
        type: "pantry",
        address: "2000 Railroad Ave, Georgetown, TX 78626",
        hours: "Mon-Fri: 9 AM - 4 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6358, longitude: -97.6775)
    ),
    PantryLocation(
        name: "Central Texas Food Bank",
        type: "pantry",
        address: "6500 Metropolis Dr, Austin, TX 78744",
        hours: "Mon-Fri: 8 AM - 5 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2030, longitude: -97.7121)
    ),
    PantryLocation(
        name: "Hope Food Pantry Austin",
        type: "pantry",
        address: "4001 Speedway, Austin, TX 78751",
        hours: "Thu-Fri: 9 AM - 10:30 AM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3015, longitude: -97.7291)
    ),
    PantryLocation(
        name: "Round Rock Serving Center",
        type: "pantry",
        address: "1099 E Main St, Round Rock, TX 78664",
        hours: "Mon-Fri: 10 AM - 4 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5097, longitude: -97.6687)
    ),
    PantryLocation(
        name: "Wolf Lakes Village H-E-B",
        type: "grocery",
        address: "1010 W University Ave, Georgetown, TX 78628",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6346, longitude: -97.6896)
    ),
    PantryLocation(
        name: "Randalls Georgetown",
        type: "grocery",
        address: "5721 Williams Dr, Georgetown, TX 78633",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6865, longitude: -97.7161)
    ),
    PantryLocation(
        name: "Sprouts Farmers Market",
        type: "grocery",
        address: "4610 Williams Dr Ste 107, Georgetown, TX 78633",
        hours: "Mon–Sun: 7 AM – 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6728, longitude: -97.7058)
    ),
    PantryLocation(
        name: "Central Market North Lamar",
        type: "grocery",
        address: "4001 N Lamar Blvd, Austin, TX 78756",
        hours: "Mon–Sun: 8 AM – 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3060, longitude: -97.7394)
    ),
    PantryLocation(
        name: "H Mart Austin",
        type: "grocery",
        address: "11301 Lakeline Blvd Ste 124, Austin, TX 78717",
        hours: "Mon–Sun: 8 AM – 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4789, longitude: -97.7865)
    ),
    PantryLocation(
        name: "Walmart Supercenter Georgetown",
        type: "grocery",
        address: "620 I-35 S, Georgetown, TX 78628",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6277, longitude: -97.6869)
    ),
    PantryLocation(
        name: "H-E-B plus!",
        type: "grocery",
        address: "11000 Lakeline Blvd, Austin, TX 78717",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4727, longitude: -97.8037)
    ),
    PantryLocation(
        name: "Natural Grocers",
        type: "grocery",
        address: "1335 E Whitestone Blvd, Cedar Park, TX 78613",
        hours: "Mon–Sat: 8:27 AM – 8:05 PM, Sun: 8:57 AM – 7:35 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5245, longitude: -97.8115)
    ),
    PantryLocation(
        name: "Trader Joe's",
        type: "grocery",
        address: "11501 Century Oaks Terrace, Austin, TX 78758",
        hours: "Mon–Sun: 9 AM – 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4022, longitude: -97.7196)
    ),
    PantryLocation(
        name: "99 Ranch Market",
        type: "grocery",
        address: "6929 Airport Blvd, Austin, TX 78752",
        hours: "Mon–Sun: 9 AM – 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3356, longitude: -97.7147)
    ),
    PantryLocation(
        name: "Whole Foods Market",
        type: "grocery",
        address: "525 N Lamar Blvd, Austin, TX 78703",
        hours: "Mon–Sun: 8 AM – 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2706, longitude: -97.7531)
    ),
    PantryLocation(
        name: "Hill Country Community Ministries",
        type: "pantry",
        address: "1005 Lacy Dr, Leander, TX 78641",
        hours: "Mon-Wed, Fri: 9 AM-12 PM & 1-3 PM, Thu: 9 AM-12 PM & 1-7 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5756, longitude: -97.8540)
    ),
    PantryLocation(
        name: "Brighter Days Food Pantry",
        type: "pantry",
        address: "300 Crystal Falls Pkwy, Leander, TX 78641",
        hours: "Wed: 5:30 PM – 7 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5843, longitude: -97.8631)
    ),
    PantryLocation(
        name: "H-E-B plus! Leander",
        type: "grocery",
        address: "651 N US Hwy 183, Leander, TX 78641",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5861, longitude: -97.8580)
    ),
    PantryLocation(
        name: "Leander Grocery (Citgo)",
        type: "grocery",
        address: "307 N US Hwy 183, Leander, TX 78641",
        hours: "Mon–Sat: 6 AM – 10 PM, Sun: 8 AM – 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5818, longitude: -97.8548)
    ),
    PantryLocation(
        name: "Whole Foods Market (365)",
        type: "grocery",
        address: "5001 183A, Cedar Park, TX 78641",
        hours: "Mon–Sun: 8 AM – 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5401, longitude: -97.8286)
    ),
    PantryLocation(
        name: "H-E-B Mueller",
        type: "grocery",
        address: "1801 E 51st St, Austin, TX 78723",
        hours: "Mon-Sun: 6 AM - 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3013, longitude: -97.7028)
    ),
    PantryLocation(
        name: "Vegan Nom Food Park",
        type: "vegan",
        address: "2308 E Cesar Chavez St, Austin, TX 78702",
        hours: "Mon-Sun: 8 AM - 10 PM (select trucks vary)",
        coordinate: CLLocationCoordinate2D(latitude: 30.2547, longitude: -97.7176)
    ),
    PantryLocation(
        name: "Fabrik Austin",
        type: "vegan",
        address: "1701 E Martin Luther King Jr Blvd, Austin, TX 78702",
        hours: "Wed-Sat: 5 PM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2785, longitude: -97.7234)
    ),
    PantryLocation(
        name: "Casa de Luz Village",
        type: "vegan",
        address: "1701 Toomey Rd, Austin, TX 78704",
        hours: "Mon-Sun: 7 AM - 8:30 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2646, longitude: -97.7592)
    ),
    PantryLocation(
        name: "The Vegan Yacht",
        type: "vegan",
        address: "2000 Southern Oaks Dr, Austin, TX 78745",
        hours: "Tue-Sat: 12 PM - 8 PM, Sun-Mon: 12 PM - 5 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2289, longitude: -97.7794)
    ),
    PantryLocation(
        name: "Micah 6 Food Pantry",
        type: "pantry",
        address: "2203 San Antonio St, Austin, TX 78705",
        hours: "Thu: 5:30 PM - 7 PM, Sat: 9:30 AM - 11 AM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2858, longitude: -97.7417)
    ),
    PantryLocation(
        name: "El Buen Samaritano",
        type: "pantry",
        address: "7000 Woodhue Dr, Austin, TX 78744",
        hours: "Tue & Thu: 8 AM - 10 AM",
        coordinate: CLLocationCoordinate2D(latitude: 30.1915, longitude: -97.7695)
    ),
    PantryLocation(
        name: "St. Andrews Presbyterian Food Pantry",
        type: "pantry",
        address: "14311 Wells Port Dr, Austin, TX 78728",
        hours: "2nd & 4th Sat: 9 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4503, longitude: -97.6745)
    ),
    PantryLocation(
        name: "Sangam Chettinad (Pure Veg)",
        type: "vegetarian",
        address: "11301 Lakeline Blvd #105, Austin, TX 78717",
        hours: "Tue-Sun: 11 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4785, longitude: -97.7860)
    ),
    PantryLocation(
        name: "Curry Soup (Pure Veg)",
        type: "vegetarian",
        address: "13530 Ronald Reagan Blvd, Cedar Park, TX 78613",
        hours: "Tue-Sun: 11 AM - 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5512, longitude: -97.8015)
    ),
    PantryLocation(
        name: "Casa de Luz Village",
        type: "vegan",
        address: "1701 Toomey Rd, Austin, TX 78704",
        hours: "Mon-Sun: 7 AM - 8:30 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2646, longitude: -97.7592)
    ),
    PantryLocation(
        name: "Wheatsville Food Co-op",
        type: "grocery",
        address: "3101 Guadalupe St, Austin, TX 78705",
        hours: "Mon-Sun: 7:30 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3001, longitude: -97.7411)
    ),
    PantryLocation(
        name: "Natural Grocers Mueller",
        type: "grocery",
        address: "3901 Airport Blvd, Austin, TX 78722",
        hours: "Mon-Sat: 8:30 AM - 8 PM, Sun: 9 AM - 7:30 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2941, longitude: -97.7145)
    ),
    PantryLocation(
        name: "El Palote Panaderia",
        type: "vegan",
        address: "2537 S Buckner Blvd, Dallas, TX 75227",
        hours: "Wed-Sat: 11 AM - 8 PM, Sun: 11 AM - 6:30 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.7481, longitude: -96.6853)
    ),
    PantryLocation(
        name: "D'Vegan (Vietnamese)",
        type: "vegan",
        address: "9780 Walnut St, Dallas, TX 75243",
        hours: "Mon-Sun (Closed Tue): 10 AM - 7 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.9133, longitude: -96.7215)
    ),
    PantryLocation(
        name: "Vegan Food House",
        type: "vegan",
        address: "832 W Seventh St, Dallas, TX 75208",
        hours: "Daily: 11:30 AM - 9 PM (10 PM Fri-Sat)",
        coordinate: CLLocationCoordinate2D(latitude: 32.7483, longitude: -96.8361)
    ),
    PantryLocation(
        name: "Flower Child",
        type: "vegetarian",
        address: "5450 W Lovers Ln, Dallas, TX 75209",
        hours: "Daily: 11 AM - 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.8515, longitude: -96.8188)
    ),
    PantryLocation(
        name: "Kalachandji's",
        type: "vegetarian",
        address: "5430 Gurley Ave, Dallas, TX 75223",
        hours: "Tue-Sun: 11:30 AM - 2 PM, 5:30 PM - 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.7915, longitude: -96.7575)
    ),
    PantryLocation(
        name: "West Dallas Food Pantry",
        type: "pantry",
        address: "3330 N Hampton Rd, Dallas, TX 75212",
        hours: "Tue-Fri: 9 AM - 1 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.7845, longitude: -96.8652)
    ),
    PantryLocation(
        name: "Aunt Bette's Community Pantry",
        type: "pantry",
        address: "1600 Pennsylvania Ave, Dallas, TX 75215",
        hours: "Mon/Wed: 8 AM - 11:45 AM, Tue: 1 PM - 4:45 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.7628, longitude: -96.7715)
    ),
    PantryLocation(
        name: "Govinda's Vegetarian Cuisine",
        type: "vegetarian",
        address: "1320 W 34th St, Houston, TX 77018",
        hours: "Daily: 11 AM - 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.8184, longitude: -95.4284)
    ),
    PantryLocation(
        name: "Trendy Vegan",
        type: "vegan",
        address: "3821 Richmond Ave, Houston, TX 77027",
        hours: "Daily: 11 AM - 8:45 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.7317, longitude: -95.4414)
    ),
    PantryLocation(
        name: "Sunshine's Vegetarian Deli",
        type: "vegetarian",
        address: "3102 Old Spanish Trl, Houston, TX 77054",
        hours: "Mon-Sat: 10 AM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.7025, longitude: -95.3789)
    ),
    PantryLocation(
        name: "Korny Vibes",
        type: "vegan",
        address: "403 Westheimer Rd, Houston, TX 77006",
        hours: "Mon-Thu: 11 AM - 9 PM, Fri-Sat: 11 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.7431, longitude: -95.3888)
    ),
    PantryLocation(
        name: "Quan Yin Vegan Restaurant",
        type: "vegan",
        address: "10804 Bellaire Blvd Suite E, Houston, TX 77072",
        hours: "Mon-Sun (Closed Tue): 11 AM - 8 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.7042, longitude: -95.5654)
    ),
    PantryLocation(
        name: "Wesley Food Pantry",
        type: "pantry",
        address: "1235 Lorraine St, Houston, TX 77009",
        hours: "Wed & Fri: 9 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.7785, longitude: -95.3492)
    ),
    PantryLocation(
        name: "Good Hope Church Pantry",
        type: "pantry",
        address: "3015 N MacGregor Way, Houston, TX 77004",
        hours: "Sat: 9 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.7156, longitude: -95.3672)
    ),
    PantryLocation(
        name: "East Spring Branch Food Pantry",
        type: "pantry",
        address: "7901 Westview Dr, Houston, TX 77055",
        hours: "Mon-Tue & Thu: 11 AM - 2 PM, Sat: 10 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.7941, longitude: -95.4852)
    ),
    PantryLocation(
        name: "Jacinto City Food Pantry",
        type: "pantry",
        address: "1026 Mercury Dr, Jacinto City, TX 77029",
        hours: "Mon, Wed, Fri: 9 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.7712, longitude: -95.2285)
    ),
    PantryLocation(
        name: "The Beacon Houston",
        type: "pantry",
        address: "1212 Prairie St, Houston, TX 77002",
        hours: "Mon-Fri: 7 AM - 1 PM (Meal Service)",
        coordinate: CLLocationCoordinate2D(latitude: 29.7601, longitude: -95.3615)
    ),
    PantryLocation(
        name: "Sunshine's Health Food Store",
        type: "grocery",
        address: "3102 Old Spanish Trl, Houston, TX 77054",
        hours: "Mon-Sat: 9 AM - 7 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.7025, longitude: -95.3789)
    ),
    PantryLocation(
        name: "Phoenicia Specialty Foods",
        type: "grocery",
        address: "1001 Austin St, Houston, TX 77010",
        hours: "Daily: 9 AM - 8 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.7544, longitude: -95.3621)
    ),
    PantryLocation(
        name: "San San Tofu",
        type: "grocery",
        address: "6445 Wilcrest Dr, Houston, TX 77072",
        hours: "Wed-Mon: 9 AM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.7028, longitude: -95.5684)
    ),
    PantryLocation(
        name: "Pyburn's Farm Fresh Foods",
        type: "grocery",
        address: "7125 Scott St, Houston, TX 77021",
        hours: "Daily: 7 AM - 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.6841, longitude: -95.3625)
    ),
    PantryLocation(
        name: "Central Market Houston",
        type: "grocery",
        address: "3815 Westheimer Rd, Houston, TX 77027",
        hours: "Daily: 8 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.7416, longitude: -95.4398)
    ),
    PantryLocation(
        name: "H Mart - Royal Lane",
        type: "grocery",
        address: "2534 Royal Ln, Dallas, TX 75229",
        hours: "Daily: 8 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.8954, longitude: -96.8924)
    ),
    PantryLocation(
        name: "Cox Farms Market - Dallas",
        type: "grocery",
        address: "778 Fort Worth Ave, Dallas, TX 75208",
        hours: "Mon-Sat: 8 AM - 8 PM, Sun: 9 AM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.7712, longitude: -96.8344)
    ),
    PantryLocation(
        name: "Natural Grocers - Casa Linda",
        type: "grocery",
        address: "9440 Garland Rd, Dallas, TX 75218",
        hours: "Mon-Sat: 8:27 AM - 8:36 PM, Sun: 8:57 AM - 7:36 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.8360, longitude: -96.7118)
    ),
    PantryLocation(
        name: "Natural Grocers - Preston & Forest",
        type: "grocery",
        address: "11661 Preston Rd #224, Dallas, TX 75230",
        hours: "Mon-Sat: 8:27 AM - 8:36 PM, Sun: 8:57 AM - 7:36 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.9071, longitude: -96.8041)
    ),
    PantryLocation(
        name: "Ann's Health Food Center & Market - Oak Cliff",
        type: "grocery",
        address: "2634 S Zang Blvd, Dallas, TX 75224",
        hours: "Mon-Sat: 9 AM - 7:30 PM, Sun: 11 AM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.7231, longitude: -96.8228)
    ),
    PantryLocation(
        name: "Ann's Health Food Center & Market - Red Bird",
        type: "grocery",
        address: "2550 W Red Bird Ln #207, Dallas, TX 75237",
        hours: "Mon-Sat: 9 AM - 7 PM, Sun: 12 PM - 5 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.6785, longitude: -96.8587)
    ),
    PantryLocation(
        name: "Homestead Market",
        type: "grocery",
        address: "169 Halbert Ln, Waco, TX 76705",
        hours: "Mon-Sat: 9:30 AM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 31.6585, longitude: -97.1325)
    ),
    PantryLocation(
        name: "Shepherd's Heart Pantry",
        type: "pantry",
        address: "1401 N 34th St, Waco, TX 76710",
        hours: "Mon/Wed: 8 AM - 1 PM, Thu: 12 PM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 31.5458, longitude: -97.1725)
    ),
    PantryLocation(
        name: "Harvest on 25th",
        type: "vegan",
        address: "114 N 25th St, Waco, TX 76710",
        hours: "Mon-Sat: 8 AM - 3 PM",
        coordinate: CLLocationCoordinate2D(latitude: 31.5515, longitude: -97.1565)
    ),
    PantryLocation(
        name: "Luna Clean Food Café",
        type: "vegan",
        address: "1516 Austin Ave Ste C, Waco, TX 76701",
        hours: "Tue-Sat: 8 AM - 2 PM",
        coordinate: CLLocationCoordinate2D(latitude: 31.5502, longitude: -97.1408)
    ),
    PantryLocation(
        name: "Mamaka Bowls Waco",
        type: "vegan",
        address: "215 S University Parks Dr, Waco, TX 76701",
        hours: "Mon-Sat: 8 AM - 8 PM",
        coordinate: CLLocationCoordinate2D(latitude: 31.5595, longitude: -97.1265)
    ),
    PantryLocation(
        name: "The Wild Grain Cafe",
        type: "vegan",
        address: "3409 S Texas Ave, Bryan, TX 77802",
        hours: "Wed-Sun: 8 AM - 3 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6355, longitude: -96.3542)
    ),
    PantryLocation(
        name: "Sweet Paris Crêperie",
        type: "vegetarian",
        address: "143 Century Square Dr #110, College Station, TX 77840",
        hours: "Daily: 8 AM - 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6255, longitude: -96.3402)
    ),
    PantryLocation(
        name: "Brazos Valley Food Bank",
        type: "pantry",
        address: "1501 S Texas Ave, Bryan, TX 77802",
        hours: "Mon-Fri: 8 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6558, longitude: -96.3685)
    ),
    PantryLocation(
        name: "Village Foods & Pharmacy",
        type: "grocery",
        address: "1760 Briarcrest Dr, Bryan, TX 77802",
        hours: "Mon-Sat: 8 AM - 8 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6485, longitude: -96.3412)
    ),
    PantryLocation(
        name: "Green Vegetarian Cuisine",
        type: "vegetarian",
        address: "255 E Basse Rd, San Antonio, TX 78209",
        hours: "Sun-Thu: 11 AM - 9 PM, Fri: 11 AM - 8 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.4975, longitude: -98.4715)
    ),
    PantryLocation(
        name: "Vegan Avenue",
        type: "vegan",
        address: "2512 N Main Ave, San Antonio, TX 78212",
        hours: "Tue-Sun: 11 AM - 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.4525, longitude: -98.4955)
    ),
    PantryLocation(
        name: "New Braunfels Food Bank",
        type: "pantry",
        address: "1620 S Seguin Ave, New Braunfels, TX 78130",
        hours: "Mon-Fri: 8 AM - 4 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.6825, longitude: -98.1125)
    ),
    PantryLocation(
        name: "Cornucopia Health Foods",
        type: "grocery",
        address: "1102 N Walnut Ave, New Braunfels, TX 78130",
        hours: "Mon-Sat: 9 AM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.7155, longitude: -98.1185)
    ),
    PantryLocation(
        name: "Joe's Pantry",
        type: "pantry",
        address: "8102 Lyndon B. Johnson Fwy, Dallas, TX 75251",
        hours: "Tue, Thu, Sat: 8 AM-10 AM & 12 PM-2 PM, Wed & Fri: 10 AM-1 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.9238, longitude: -96.7648)
    ),
    PantryLocation(
        name: "Saint John's Food Distribution Center",
        type: "pantry",
        address: "7500 Blessing Ave, Austin, TX 78752",
        hours: "Mon-Thu: 7:30 AM - 5 PM, Fri: 8 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3344, longitude: -97.7011)
    ),
    PantryLocation(
        name: "Our Lady of San Juan de Lagos",
        type: "pantry",
        address: "2601 Singleton Blvd, Dallas, TX 75212",
        hours: "Mon: 9:30 AM - 11 AM",
        coordinate: CLLocationCoordinate2D(latitude: 32.7856, longitude: -96.8625)
    ),
    PantryLocation(
        name: "Bouldin Creek Cafe",
        type: "vegetarian",
        address: "1900 S 1st St, Austin, TX 78704",
        hours: "Mon-Sun: 8 AM - 10 PM (Fri-Sat until 11 PM)",
        coordinate: CLLocationCoordinate2D(latitude: 30.2476, longitude: -97.7554)
    ),
    PantryLocation(
        name: "Fusion Tadka",
        type: "vegetarian",
        address: "12636 Research Blvd B-101, Austin, TX 78759",
        hours: "Mon-Sun: 8 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4287, longitude: -97.7495)
    ),
    PantryLocation(
        name: "Nori",
        type: "vegan",
        address: "3208 Guadalupe St, Ste B, Austin, TX 78705",
        hours: "Tue-Sun: 5 PM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2995, longitude: -97.7410)
    ),
    PantryLocation(
        name: "Central Market Broadway",
        type: "grocery",
        address: "4821 Broadway St, San Antonio, TX 78209",
        hours: "Mon-Sun: 8 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.4695, longitude: -98.4735)
    ),
    PantryLocation(
        name: "Nogalitos H-E-B",
        type: "grocery",
        address: "1601 Nogalitos St, San Antonio, TX 78204",
        hours: "Mon-Sun: 6 AM - 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.4074, longitude: -98.5132)
    ),
    PantryLocation(
        name: "Kroger Houston",
        type: "grocery",
        address: "1035 Gessner Rd, Houston, TX 77055",
        hours: "Mon-Sun: 6 AM - 12 AM",
        coordinate: CLLocationCoordinate2D(latitude: 29.7845, longitude: -95.5448)
    ),
    PantryLocation(
        name: "St. Vincent de Paul Society Food Pantry",
        type: "pantry",
        address: "620 Round Rock W Dr, Round Rock, TX 78681",
        hours: "Mon, Fri: 9 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5101, longitude: -97.6931)
    ),
    PantryLocation(
        name: "Greens Garden Round Rock",
        type: "vegan",
        address: "1105 S Mays St #300, Round Rock, TX 78664",
        hours: "Mon-Fri: 11 AM-2:30 PM & 4:30-8 PM, Sat: 11 AM-8 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4996, longitude: -97.6775)
    ),
    PantryLocation(
        name: "Mother Natures Cafe",
        type: "vegan",
        address: "16600 N FM 620, Round Rock, TX 78681",
        hours: "Mon-Fri: 9 AM-1:30 PM & 5-9 PM, Sat: 8:30 AM-3:30 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4952, longitude: -97.7471)
    ),
    PantryLocation(
        name: "Helping Hands - Dripping Springs",
        type: "pantry",
        address: "28710 Ranch Rd 12, Dripping Springs, TX 78620",
        hours: "Wed: 1 PM-3 PM, Thu: 4:30 PM-6:30 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.1985, longitude: -98.0872)
    ),
    PantryLocation(
        name: "Natkhat Flavors",
        type: "vegan",
        address: "333 US-290 #437, Dripping Springs, TX 78620",
        hours: "Mon-Sat: 10:30 AM - 8:30 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.1947, longitude: -98.0841)
    ),
    PantryLocation(
        name: "Rolling in Thyme & Dough",
        type: "vegetarian",
        address: "333 W Hwy 290, Dripping Springs, TX 78620",
        hours: "Mon-Sat: 8 AM - 3 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.1950, longitude: -98.0901)
    ),
    PantryLocation(
        name: "North Lake Hope Center",
        type: "pantry",
        address: "20513 Dawn Drive, Lago Vista, TX 78645",
        hours: "Tue: 4:30 PM-6:30 PM, Wed: 10 AM-12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4578, longitude: -97.9892)
    ),
    PantryLocation(
        name: "Old Farm Community Center Food Pantry",
        type: "pantry",
        address: "3500 Lohman Ford Road, Lago Vista, TX 78645",
        hours: "Select Saturdays (Check local schedule)",
        coordinate: CLLocationCoordinate2D(latitude: 30.4542, longitude: -97.9885)
    ),
    PantryLocation(
        name: "Travis County Community Center (Jonestown)",
        type: "pantry",
        address: "18649 RM 1431 #6a, Jonestown, TX 78645",
        hours: "Mon-Fri: 8 AM - 5 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4851, longitude: -97.9255)
    ),
    PantryLocation(
        name: "Lowe's Market",
        type: "grocery",
        address: "7708 Lohman Ford Rd, Lago Vista, TX 78645",
        hours: "Mon-Sun: 7 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4611, longitude: -97.9898)
    ),
    PantryLocation(
        name: "USTA Kababgy",
        type: "halal",
        address: "9310 North Lamar Blvd, Austin, TX 78753",
        hours: "Mon–Sun: 12 PM – 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3625, longitude: -97.6984)
    ),
    PantryLocation(
        name: "Lucky Halal Food Truck",
        type: "halal",
        address: "1130 Airport Blvd, Austin, TX 78702",
        hours: "Mon–Sun: 12 PM – 12 AM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2677, longitude: -97.6965)
    ),
    PantryLocation(
        name: "Shevet Cafe",
        type: "kosher",
        address: "Dell Jewish Community Center, Austin, TX 78731",
        hours: "Sunday–Friday (hours vary)",
        coordinate: CLLocationCoordinate2D(latitude: 30.3305, longitude: -97.7299)
    ),
    PantryLocation(
        name: "HEB Kosher Store & Deli",
        type: "kosher",
        address: "7025 Village Center Dr, Austin, TX 78731",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3209, longitude: -97.7792)
    ),
    PantryLocation(
        name: "Casa de Luz",
        type: "Gluten-Free",
        address: "1701 Toomey Rd, Austin, TX 78704",
        hours: "Daily: 7 AM – 8:30 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2646, longitude: -97.7592)
    ),
    PantryLocation(
        name: "ATX Cocina",
        type: "Gluten-Free",
        address: "110 San Antonio St, Austin, TX 78701",
        hours: "Mon–Thu: 5 PM–10 PM; Fri–Sun: hours vary",
        coordinate: CLLocationCoordinate2D(latitude: 30.2699, longitude: -97.7425)
    )

    PantryLocation(
        name: "H-E-B Leander (Hero Way)",
        type: "grocery",
        address: "19348 Ronald Reagan Blvd, Leander, TX 78641",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6302, longitude: -97.7915)
    ),
    PantryLocation(
        name: "Hill Country Community Ministries (Pflugerville)",
        type: "pantry",
        address: "15822 Foothill Farms Loop, Pflugerville, TX 78660",
        hours: "Tue: 1 PM - 4 PM, Thu: 9 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4382, longitude: -97.6491)
    ),
    PantryLocation(
            name: "Arlan's Market Georgetown",
            type: "grocery",
            address: "1108 S Main St, Georgetown, TX 78626",
            hours: "Mon–Sun: 7 AM – 10 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.6279, longitude: -97.6773)
    ),
    PantryLocation(
            name: "Rebel Cheese",
            type: "vegan",
            address: "2200 Aldrich St Suite 120, Austin, TX 78723",
            hours: "Mon–Sun: 9 AM – 9 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.2991, longitude: -97.7056)
        ),
        PantryLocation(
            name: "The Halal Corner",
            type: "halal",
            address: "1200 W 26th St, Austin, TX 78705",
            hours: "Mon–Sun: 11 AM – 10 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.2917, longitude: -97.7468)
        ),
        PantryLocation(
            name: "Wild Wood Bakehouse",
            type: "Gluten-Free",
            address: "3016 Guadalupe St, Austin, TX 78705",
            hours: "Tue–Sat: 11 AM – 9 PM, Sun: 10 AM – 3 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.2974, longitude: -97.7417)
        ),
        PantryLocation(
            name: "Caritas of Austin Food Pantry",
            type: "pantry",
            address: "611 Neches St, Austin, TX 78701",
            hours: "Mon–Thu: 8 AM – 4 PM, Fri: 8 AM – 11:30 AM",
            coordinate: CLLocationCoordinate2D(latitude: 30.2679, longitude: -97.7371)
        ),
        PantryLocation(
            name: "H-E-B Georgetown (S I-35)",
            type: "grocery",
            address: "1101 W University Ave, Georgetown, TX 78628",
            hours: "Mon–Sun: 6 AM – 11 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.6359, longitude: -97.6914)
        ),
        PantryLocation(
            name: "Pflugerville Community Food Pantry",
            type: "pantry",
            address: "14401 Immanuel Rd, Pflugerville, TX 78660",
            hours: "Tue: 1:30 PM - 3:30 PM, Sat: 9 AM - 11 AM",
            coordinate: CLLocationCoordinate2D(latitude: 30.4571, longitude: -97.6189)
        ),
        PantryLocation(
            name: "Dear Diary Coffee",
            type: "vegan",
            address: "1212 Chicon St #103, Austin, TX 78702",
            hours: "Mon–Sun: 7 AM – 6 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.2694, longitude: -97.7169)
        ),
        PantryLocation(
            name: "Halal Bros",
            type: "halal",
            address: "2712 Guadalupe St, Austin, TX 78705",
            hours: "Mon–Sun: 11 AM – 11 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.2929, longitude: -97.7424)
        ),
        PantryLocation(
            name: "Bountiful Blessings Food Pantry",
            type: "pantry",
            address: "204 E Pecan St, Pflugerville, TX 78660",
            hours: "1st & 3rd Sat: 9 AM - 12 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.4402, longitude: -97.6163)
        ),
        PantryLocation(
            name: "Saffron Austin",
            type: "vegetarian",
            address: "3616 Far West Blvd #113, Austin, TX 78731",
            hours: "Mon–Sun: 11 AM – 10 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.3548, longitude: -97.7562)
        ),
        PantryLocation(
            name: "Ayooga Halal Express",
            type: "halal",
            address: "1805 N Hampton Rd, Austin, TX 78705",
            hours: "Mon–Sun: 11 AM – 12 AM",
            coordinate: CLLocationCoordinate2D(latitude: 30.2811, longitude: -97.7303)
        ),
        PantryLocation(
            name: "Wheatsville Food Co-op (South)",
            type: "grocery",
            address: "4001 S Lamar Blvd, Austin, TX 78704",
            hours: "Mon-Sun: 7:30 AM - 10 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.2319, longitude: -97.7952)
        ),
        PantryLocation(
            name: "Gusto Italian Kitchen (Gluten-Free Friendly)",
            type: "Gluten-Free",
            address: "4800 Burnet Rd, Austin, TX 78756",
            hours: "Mon-Sun: 11 AM - 10 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.3195, longitude: -97.7388)
        ),
        PantryLocation(
            name: "Zucchini Kill Bakery",
            type: "vegan",
            address: "701 E 53rd St, Austin, TX 78751",
            hours: "Wed-Sun: 12 PM - 6 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.3135, longitude: -97.7142)
        ),
        PantryLocation(
            name: "Abo Youssef Mediterranean Catering",
            type: "halal",
            address: "2101 Manor Rd, Austin, TX 78722",
            hours: "Mon-Sun: 11 AM - 10 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.2839, longitude: -97.7191)
        ),
        PantryLocation(
            name: "Main Street Baptist Food Pantry",
            type: "pantry",
            address: "1001 S Main St, Georgetown, TX 78626",
            hours: "Tue & Wed: 10 AM - 12 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.6291, longitude: -97.6775)
        ),
    PantryLocation(
            name: "Circle of Hope Community Center",
            type: "pantry",
            address: "2900 W Pecan St, Pflugerville, TX 78660",
            hours: "Mon & Fri: 8 AM - 11 AM",
            coordinate: CLLocationCoordinate2D(latitude: 30.4452, longitude: -97.6418)
        ),
        PantryLocation(
            name: "Levant Halal Mediterranean Cafe",
            type: "halal",
            address: "1320 Cypress Creek Road #105, Cedar Park, TX 78613",
            hours: "Mon–Sun: 11 AM – 9 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.4735, longitude: -97.8422)
        ),
        PantryLocation(
            name: "The Well Westlake",
            type: "Gluten-Free",
            address: "6317 Bee Caves Road, Suite 200, Austin, TX 78746",
            hours: "Mon–Sun: 8 AM – 9 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.2912, longitude: -97.8285)
        ),
        PantryLocation(
            name: "Mirchi Indo-Pak Halal Restaurant",
            type: "halal",
            address: "2301 S Lakeline Blvd Suite B800, Cedar Park, TX 78613",
            hours: "Mon–Sun: 11:30 AM – 11:30 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.4704, longitude: -97.7891)
        ),
        PantryLocation(
            name: "Aladdin Halal Grill",
            type: "halal",
            address: "200 Buttercup Creek Blvd, Suite #130, Cedar Park, TX 78613",
            hours: "Mon–Sun: 11 AM – 10 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.4795, longitude: -97.8406)
        ),
        PantryLocation(
            name: "Grove Wine Bar & Kitchen Westlake",
            type: "Gluten-Free",
            address: "6317 Bee Cave Road, #380, Austin, TX 78746",
            hours: "Mon–Thu: 11 AM – 9 PM, Fri–Sat: 11 AM – 10 PM, Sun: 10:30 AM – 9 PM",
            coordinate: CLLocationCoordinate2D(latitude: 30.2908, longitude: -97.8291)
        ),
    PantryLocation(
        name: "H-E-B Pflugerville",
        type: "grocery",
        address: "201 N FM 685, Pflugerville, TX 78660",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4414, longitude: -97.6111)
    ),
    PantryLocation(
        name: "The Well Downtown",
        type: "Gluten-Free",
        address: "440 W 2nd Street, Austin, TX 78701",
        hours: "Mon–Sun: 8 AM – 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2655, longitude: -97.7479)
    ),
    PantryLocation(
        name: "Rebel Cheese (North)",
        type: "vegan",
        address: "11500 Rock Rose Ave, Austin, TX 78758",
        hours: "Mon–Sun: 10 AM – 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4019, longitude: -97.7214)
    ),
    PantryLocation(
        name: "Hutto Food Pantry",
        type: "pantry",
        address: "350 Ed Schmidt Blvd, Hutto, TX 78634",
        hours: "Sat: 8:30 AM - 11:30 AM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5482, longitude: -97.5458)
    ),
    PantryLocation(
        name: "St. William Catholic Church Food Pantry",
        type: "pantry",
        address: "620 Round Rock West Dr, Round Rock, TX 78681",
        hours: "Mon-Thu: 9 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5105, longitude: -97.6934)
    ),
    PantryLocation(
        name: "Vineyard Food Pantry",
        type: "pantry",
        address: "13208 Morris Rd, Austin, TX 78729",
        hours: "Wed: 1 PM - 3 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4594, longitude: -97.7712)
    ),
    PantryLocation(
        name: "El Buen Samaritano (Main Office)",
        type: "pantry",
        address: "7000 Woodhue Dr, Austin, TX 78744",
        hours: "Tue-Thu: 9 AM - 11 AM",
        coordinate: CLLocationCoordinate2D(latitude: 30.1915, longitude: -97.7694)
    ),
    PantryLocation(
        name: "H-E-B Hutto",
        type: "grocery",
        address: "5000 Gattis School Rd, Hutto, TX 78634",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5192, longitude: -97.5901)
    ),
    PantryLocation(
        name: "H-E-B Round Rock (Gattis School)",
        type: "grocery",
        address: "3750 Gattis School Rd, Round Rock, TX 78664",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5054, longitude: -97.6192)
    ),
    PantryLocation(
        name: "H-E-B Pflugerville (Springbrook)",
        type: "grocery",
        address: "1434 Wells Branch Pkwy, Pflugerville, TX 78660",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4431, longitude: -97.6625)
    ),
    PantryLocation(
        name: "Arlo's Curbside (South)",
        type: "vegan",
        address: "3901 Promontory Point Dr, Austin, TX 78744",
        hours: "Thu–Sun: 12 PM – 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2104, longitude: -97.7548)
    ),
    PantryLocation(
        name: "Next Level Burger",
        type: "vegan",
        address: "525 N Lamar Blvd, Austin, TX 78703",
        hours: "Mon-Sun: 11 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2706, longitude: -97.7533)
    ),
    PantryLocation(
        name: "Suprabhat (Pure Veg)",
        type: "vegetarian",
        address: "9225 W Parmer Ln, Austin, TX 78717",
        hours: "Wed–Mon: 11 AM – 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4519, longitude: -97.7612)
    ),
    PantryLocation(
        name: "Halal Wings Plus",
        type: "halal",
        address: "5320 Cameron Rd, Austin, TX 78723",
        hours: "Mon–Sun: 11 AM – 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3142, longitude: -97.7019)
    ),
    PantryLocation(
        name: "Phara's Mediterranean",
        type: "halal",
        address: "111 North Loop Blvd E, Austin, TX 78751",
        hours: "Tue–Sun: 5 PM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3184, longitude: -97.7242)
    ),
    PantryLocation(
        name: "Picnik Burnet Road",
        type: "Gluten-Free",
        address: "4801 Burnet Rd, Austin, TX 78756",
        hours: "Mon–Sun: 7 AM – 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3198, longitude: -97.7391)
    ),
    PantryLocation(
        name: "Buda United Methodist Church Food Pantry",
        type: "pantry",
        address: "302 Elm St, Buda, TX 78610",
        hours: "Wed: 10 AM - 12 PM, Sat: 8 AM - 10 AM",
        coordinate: CLLocationCoordinate2D(latitude: 30.0833, longitude: -97.8441)
    ),
    PantryLocation(
        name: "St. Ignatius Martyr Food Pantry",
        type: "pantry",
        address: "2303 Euclid Ave, Austin, TX 78704",
        hours: "Mon-Wed: 9 AM - 1 PM, Thu: 9 AM - 11 AM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2415, longitude: -97.7618)
    ),
    PantryLocation(
        name: "Travis County Community Center (Manor)",
        type: "pantry",
        address: "600 W Carrie Manor St, Manor, TX 78653",
        hours: "Mon-Fri: 8 AM - 5 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3421, longitude: -97.5645)
    ),
    PantryLocation(
        name: "Hays County Food Bank Distribution (Kyle)",
        type: "pantry",
        address: "801 Burleson St, Kyle, TX 78640",
        hours: "Tue: 12 PM - 1 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.0125, longitude: -97.8642)
    ),
    PantryLocation(
        name: "Halal Bros Round Rock",
        type: "halal",
        address: "3107 S IH 35, Round Rock, TX 78664",
        hours: "Mon-Sun: 11:30 AM - 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4901, longitude: -97.6749)
    ),
    PantryLocation(
        name: "Halal Bros Anderson Mill",
        type: "halal",
        address: "11521 N FM 620, Austin, TX 78726",
        hours: "Mon-Sun: 11:30 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4578, longitude: -97.7925)
    ),
    PantryLocation(
        name: "H-E-B Kyle",
        type: "grocery",
        address: "5401 South FM 1626, Kyle, TX 78640",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.0215, longitude: -97.8912)
    ),
    PantryLocation(
        name: "H-E-B Buda",
        type: "grocery",
        address: "15300 S IH 35 Frontage Rd, Buda, TX 78610",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.0864, longitude: -97.8214)
    ),
    PantryLocation(
        name: "H-E-B Manor",
        type: "grocery",
        address: "13649 US-290, Manor, TX 78653",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3498, longitude: -97.5402)
    ),
    PantryLocation(
        name: "The Beer Plant",
        type: "vegan",
        address: "3110 Windsor Rd, Austin, TX 78703",
        hours: "Tue-Sun: 4 PM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2921, longitude: -97.7635)
    ),
    PantryLocation(
        name: "Citizen Eatery",
        type: "vegetarian",
        address: "5011 Burnet Rd, Austin, TX 78756",
        hours: "Mon-Sun: 11 AM - 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3228, longitude: -97.7394)
    ),
    PantryLocation(
        name: "Gati Ice Cream",
        type: "vegan",
        address: "1512 Holly St, Austin, TX 78702",
        hours: "Mon-Sun: 11 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2524, longitude: -97.7241)
    ),
    PantryLocation(
        name: "Wild Wood Bakehouse Bakery",
        type: "Gluten-Free",
        address: "100 12th St, Austin, TX 78701",
        hours: "Mon-Sat: 9 AM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2731, longitude: -97.7412)
    ),
    PantryLocation(
        name: "Capital Area Rural Transportation System (CARTS) Food Delivery Hub",
        type: "pantry",
        address: "2300 E 7th St, Austin, TX 78702",
        hours: "Mon-Fri: 8 AM - 4 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2625, longitude: -97.7151)
    ),
    PantryLocation(
        name: "St. John's Community Food Pantry",
        type: "pantry",
        address: "500 E Wonsley Dr, Austin, TX 78753",
        hours: "Wed: 9 AM - 11 AM, Sat: 9 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3448, longitude: -97.6972)
    ),
    PantryLocation(
        name: "Hill Country Nazarene Food Pantry",
        type: "pantry",
        address: "1750 Bagdad Rd, Cedar Park, TX 78613",
        hours: "Tue & Thu: 10 AM - 1 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5189, longitude: -97.8465)
    ),
    PantryLocation(
        name: "Fiesta Mart IH-35",
        type: "grocery",
        address: "3909 N Interstate 35 SB, Austin, TX 78722",
        hours: "Mon–Sun: 7 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2979, longitude: -97.7188)
    ),
    PantryLocation(
        name: "MT Supermarket",
        type: "grocery",
        address: "10901 N Lamar Blvd, Austin, TX 78753",
        hours: "Mon–Sun: 9 AM – 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3752, longitude: -97.6891)
    ),
    PantryLocation(
        name: "Asiana Indian Cuisine",
        type: "vegetarian",
        address: "801 E William Cannon Dr #205, Austin, TX 78745",
        hours: "Wed–Mon: 11 AM – 9:30 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.1982, longitude: -97.7714)
    ),
    PantryLocation(
        name: "Nadam (Pure Veg)",
        type: "vegetarian",
        address: "13343 US-183 #250, Austin, TX 78750",
        hours: "Tue–Sun: 11:30 AM – 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4468, longitude: -97.7994)
    ),
    PantryLocation(
        name: "Aster's Ethiopian Restaurant",
        type: "vegetarian",
        address: "2801 IH-35 Frontage Rd, Austin, TX 78722",
        hours: "Tue–Sun: 11 AM – 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2905, longitude: -97.7226)
    ),
    PantryLocation(
        name: "Shandeez Mediterranean Grill",
        type: "halal",
        address: "11508 Palmway Ln, Austin, TX 78759",
        hours: "Mon–Sun: 11 AM – 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4182, longitude: -97.7471)
    ),
    PantryLocation(
        name: "Kismet Cafe",
        type: "halal",
        address: "1000 E 41st St #200, Austin, TX 78751",
        hours: "Mon–Sun: 10 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2998, longitude: -97.7185)
    ),
    PantryLocation(
        name: "Lil' Nonna's Vegan Pizza",
        type: "vegan",
        address: "440 E St Elmo Rd A-1, Austin, TX 78745",
        hours: "Tue–Sun: 4 PM – 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2148, longitude: -97.7612)
    ),
    PantryLocation(
        name: "Plow Burger",
        type: "vegan",
        address: "1505 Town Creek Dr, Austin, TX 78741",
        hours: "Mon–Sun: 11 AM – 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2435, longitude: -97.7268)
    ),
    PantryLocation(
        name: "Thai Fresh (Gluten-Free Bakery Selection)",
        type: "Gluten-Free",
        address: "909 W Mary St, Austin, TX 78704",
        hours: "Mon–Sun: 9 AM – 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2452, longitude: -97.7594)
    ),
    PantryLocation(
        name: "Bastrop County Emergency Food Pantry",
        type: "pantry",
        address: "806 Fayette St, Bastrop, TX 78602",
        hours: "Mon-Fri: 8 AM - 4 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.1042, longitude: -97.3115)
    ),
    PantryLocation(
        name: "Lockhart Food Pantry",
        type: "pantry",
        address: "1115 S Commerce St, Lockhart, TX 78644",
        hours: "Tue: 1 PM - 4 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.8732, longitude: -97.6748)
    ),
    PantryLocation(
        name: "LACARE Food Pantry (Burnet)",
        type: "pantry",
        address: "507 W Jackson St, Burnet, TX 78611",
        hours: "Mon, Wed, Fri: 9 AM - 2 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.7571, longitude: -98.2312)
    ),
    PantryLocation(
        name: "Helping Hands Ministry of Belton",
        type: "pantry",
        address: "2210 Holland Rd, Belton, TX 76513",
        hours: "Mon & Wed: 10 AM - 12 PM, Thu: 4 PM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 31.0524, longitude: -97.4518)
    ),
    PantryLocation(
        name: "H-E-B San Marcos",
        type: "grocery",
        address: "641 E Hopkins St, San Marcos, TX 78666",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.8835, longitude: -97.9304)
    ),
    PantryLocation(
        name: "H-E-B Marble Falls",
        type: "grocery",
        address: "1503 Hwy 1431 W, Marble Falls, TX 78654",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5739, longitude: -98.2872)
    ),
    PantryLocation(
        name: "H-E-B Bastrop",
        type: "grocery",
        address: "104 Hasler Blvd, Bastrop, TX 78602",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.1132, longitude: -97.3248)
    ),
    PantryLocation(
        name: "H-E-B Elgin",
        type: "grocery",
        address: "1080 Hwy 290 E, Elgin, TX 78621",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3478, longitude: -97.3512)
    ),
    PantryLocation(
        name: "H-E-B Lockhart",
        type: "grocery",
        address: "403 S Colorado St, Lockhart, TX 78644",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.8812, longitude: -97.6719)
    ),
    PantryLocation(
        name: "Prik Nam Pla (Vegan Friendly Selection)",
        type: "vegan",
        address: "1911 Dutton Dr, San Marcos, TX 78666",
        hours: "Tue–Sun: 11 AM – 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.8694, longitude: -97.9548)
    ),
    PantryLocation(
        name: "The Hitch-N-Post Cafe",
        type: "vegetarian",
        address: "104 Lake Rd, Belton, TX 76513",
        hours: "Mon–Sat: 7 AM – 2 PM",
        coordinate: CLLocationCoordinate2D(latitude: 31.0645, longitude: -97.4725)
    ),
    PantryLocation(
        name: "Sabor de mi Tierra (Halal Menu items)",
        type: "halal",
        address: "515 W San Antonio St, San Marcos, TX 78666",
        hours: "Mon–Sat: 10 AM – 8 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.8811, longitude: -97.9452)
    ),
    PantryLocation(
        name: "Industry San Marcos (Gluten-Free Friendly)",
        type: "Gluten-Free",
        address: "110 E Martin Luther King Dr, San Marcos, TX 78666",
        hours: "Mon–Sun: 11 AM – 12 AM",
        coordinate: CLLocationCoordinate2D(latitude: 29.8791, longitude: -97.9405)
    ),
    PantryLocation(
        name: "Costco Wholesale Pflugerville",
        type: "grocery",
        address: "1901 Kelly Ln, Pflugerville, TX 78660",
        hours: "Mon-Fri: 10 AM - 8:30 PM, Sat: 9:30 AM - 6 PM, Sun: 10 AM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4524, longitude: -97.5948)
    ),
    PantryLocation(
        name: "Costco Wholesale Cedar Park",
        type: "grocery",
        address: "4601 183A Toll Rd, Cedar Park, TX 78613",
        hours: "Mon-Fri: 10 AM - 8:30 PM, Sat: 9:30 AM - 6 PM, Sun: 10 AM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5284, longitude: -97.8071)
    ),
    PantryLocation(
        name: "Costco Wholesale NE Austin",
        type: "grocery",
        address: "10401 Research Blvd, Austin, TX 78759",
        hours: "Mon-Fri: 10 AM - 8:30 PM, Sat: 9:30 AM - 6 PM, Sun: 10 AM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3891, longitude: -97.7412)
    ),
    PantryLocation(
        name: "Walmart Supercenter Round Rock (I-35)",
        type: "grocery",
        address: "2701 S Interstate 35, Round Rock, TX 78664",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4905, longitude: -97.6784)
    ),
    PantryLocation(
        name: "Walmart Supercenter Round Rock East",
        type: "grocery",
        address: "4700 E Palm Valley Blvd, Round Rock, TX 78665",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5189, longitude: -97.6152)
    ),
    PantryLocation(
        name: "Walmart Supercenter Cedar Park",
        type: "grocery",
        address: "201 Walton Way, Cedar Park, TX 78613",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4791, longitude: -97.8242)
    ),
    PantryLocation(
        name: "Walmart Supercenter Pflugerville",
        type: "grocery",
        address: "1548 FM 685, Pflugerville, TX 78660",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4512, longitude: -97.6215)
    ),
    PantryLocation(
        name: "H-E-B Taylor",
        type: "grocery",
        address: "100 Carlos G Parker Blvd NW, Taylor, TX 76574",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5842, longitude: -97.4215)
    ),
    PantryLocation(
        name: "H-E-B Round Rock (University Blvd)",
        type: "grocery",
        address: "14340 Ronald Reagan Blvd, Leander, TX 78641",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5891, longitude: -97.7845)
    ),
    PantryLocation(
        name: "H-E-B Leander (US-183)",
        type: "grocery",
        address: "651 N US Hwy 183, Leander, TX 78641",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5862, longitude: -97.8581)
    ),
    PantryLocation(
        name: "Shepherd's Heart Taylor Food Pantry",
        type: "pantry",
        address: "410 W 7th St, Taylor, TX 76574",
        hours: "Tue: 1 PM - 4 PM, Thu: 1 PM - 4 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5731, longitude: -97.4158)
    ),
    PantryLocation(
        name: "Rock Round-Up Food Pantry",
        type: "pantry",
        address: "610 S Austin Ave, Georgetown, TX 78626",
        hours: "Mon-Wed: 9 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6315, longitude: -97.6765)
    ),
    PantryLocation(
        name: "Manor Food Pantry Community Center",
        type: "pantry",
        address: "401 W Murray Ave, Manor, TX 78653",
        hours: "Sat: 9 AM - 11 AM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3441, longitude: -97.5591)
    ),
    PantryLocation(
        name: "Costco Wholesale S Austin",
        type: "grocery",
        address: "4301 W William Cannon Dr Bldg A Ste 100, Austin, TX 78749",
        hours: "Mon-Fri: 10 AM - 8:30 PM, Sat: 9:30 AM - 6 PM, Sun: 10 AM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2245, longitude: -97.8214)
    ),
    PantryLocation(
        name: "Costco Wholesale Georgetown",
        type: "grocery",
        address: "2201A N IH 35, Georgetown, TX 78626",
        hours: "Mon-Fri: 10 AM - 8:30 PM, Sat: 9:30 AM - 6 PM, Sun: 10 AM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6612, longitude: -97.6894)
    ),
    PantryLocation(
        name: "Costco Wholesale Liberty Hill",
        type: "grocery",
        address: "595 US 183, Liberty Hill, TX 78642",
        hours: "Mon-Fri: 10 AM - 8:30 PM, Sat: 9:30 AM - 6 PM, Sun: 10 AM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6489, longitude: -97.8925)
    ),
    PantryLocation(
        name: "Riverside H-E-B plus!",
        type: "grocery",
        address: "2508 E Riverside Dr, Austin, TX 78741",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2325, longitude: -97.7214)
    ),
    PantryLocation(
        name: "Hancock Center H-E-B",
        type: "grocery",
        address: "1000 E 41st St, Austin, TX 78751",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2995, longitude: -97.7181)
    ),
    PantryLocation(
        name: "7th Street H-E-B",
        type: "grocery",
        address: "2701 E 7th St, Austin, TX 78702",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2594, longitude: -97.7115)
    ),
    PantryLocation(
        name: "Burnet Rd H-E-B",
        type: "grocery",
        address: "5808 Burnet Rd, Austin, TX 78756",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3341, longitude: -97.7392)
    ),
    PantryLocation(
        name: "Austin S Interstate 35 Walmart Supercenter",
        type: "grocery",
        address: "9300 S Interstate 35 Ste B, Austin, TX 78748",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.1585, longitude: -97.7942)
    ),
    PantryLocation(
        name: "Austin Brodie Ln Walmart Supercenter",
        type: "grocery",
        address: "5017 W Highway 290, Austin, TX 78735",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2319, longitude: -97.8245)
    ),
    PantryLocation(
        name: "Austin E Ben White Blvd Walmart Supercenter",
        type: "grocery",
        address: "710 E Ben White Blvd, Austin, TX 78704",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2185, longitude: -97.7562)
    ),
    PantryLocation(
        name: "Austin Ranch Rd Walmart Supercenter",
        type: "grocery",
        address: "13201 Ranch Rd 620 N, Austin, TX 78717",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4682, longitude: -97.7915)
    ),
    PantryLocation(
        name: "Operation Liberty Hill Food Pantry",
        type: "pantry",
        address: "1401 Hwy 183, Liberty Hill, TX 78642",
        hours: "Tue & Thu: 10 AM - 1 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6625, longitude: -97.9048)
    ),
    PantryLocation(
        name: "Bertram Food Pantry",
        type: "pantry",
        address: "132 N West St, Bertram, TX 78605",
        hours: "Thu: 1 PM - 4 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.7441, longitude: -98.0562)
    ),
    PantryLocation(
        name: "The Storehouse Food Pantry",
        type: "pantry",
        address: "1020 Kollhope Rd, Fredericksburg, TX 78624",
        hours: "Wed & Sat: 9 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2591, longitude: -98.8845)
    ),
    PantryLocation(
        name: "Smithville Food Pantry",
        type: "pantry",
        address: "107 SW 2nd St, Smithville, TX 78957",
        hours: "Wed: 9 AM - 11:30 AM",
        coordinate: CLLocationCoordinate2D(latitude: 30.0092, longitude: -97.1614)
    ),
    PantryLocation(
        name: "Luling Food Pantry",
        type: "pantry",
        address: "701 E Davis St, Luling, TX 78648",
        hours: "Thu: 9 AM - 1 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.6795, longitude: -97.6418)
    ),
    PantryLocation(
        name: "Giddings Food Pantry",
        type: "pantry",
        address: "190 N Harris St, Giddings, TX 78942",
        hours: "Wed: 8:30 AM - 11 AM",
        coordinate: CLLocationCoordinate2D(latitude: 30.1834, longitude: -96.9385)
    ),
    PantryLocation(
        name: "The Local Vegan (Mobile Unit)",
        type: "vegan",
        address: "120 Main St, Buda, TX 78610",
        hours: "Fri–Sun: 11 AM – 7 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.0841, longitude: -97.8425)
    ),
    PantryLocation(
        name: "Blanco County South Food Pantry",
        type: "pantry",
        address: "610 Main St, Blanco, TX 78606",
        hours: "1st & 3rd Sat: 9 AM - 11 AM",
        coordinate: CLLocationCoordinate2D(latitude: 30.0984, longitude: -98.4215)
    ),
    PantryLocation(
        name: "H-E-B Lockhart (S Colorado St)",
        type: "grocery",
        address: "1900 S Colorado St, Lockhart, TX 78644",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.8654, longitude: -97.6791)
    ),
    PantryLocation(
        name: "Walmart Supercenter Lockhart",
        type: "grocery",
        address: "1900 W San Antonio St, Lockhart, TX 78644",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.8839, longitude: -97.6948)
    ),
    PantryLocation(
        name: "H-E-B Bastrop (Hwy 71)",
        type: "grocery",
        address: "733 Hwy 71 W, Bastrop, TX 78602",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.1082, longitude: -97.3514)
    ),
    PantryLocation(
        name: "Walmart Supercenter Bastrop",
        type: "grocery",
        address: "488 Hwy 71 W, Bastrop, TX 78602",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.1031, longitude: -97.3394)
    ),
    PantryLocation(
        name: "H-E-B Marble Falls (Hwy 281)",
        type: "grocery",
        address: "1503 Bluebonnet Dr, Marble Falls, TX 78654",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5735, longitude: -98.2741)
    ),
    PantryLocation(
        name: "Walmart Supercenter Marble Falls",
        type: "grocery",
        address: "2700 US-281, Marble Falls, TX 78654",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6015, longitude: -98.2718)
    ),
    PantryLocation(
        name: "H-E-B Burnet",
        type: "grocery",
        address: "105 S Boundary St, Burnet, TX 78611",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.7548, longitude: -98.2385)
    ),
    PantryLocation(
        name: "H-E-B Fredericksburg",
        type: "grocery",
        address: "407 S Adams St, Fredericksburg, TX 78624",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2694, longitude: -98.8785)
    ),
    PantryLocation(
        name: "Walmart Supercenter Fredericksburg",
        type: "grocery",
        address: "1435 E Main St, Fredericksburg, TX 78624",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2652, longitude: -98.8554)
    ),
    PantryLocation(
        name: "H-E-B San Marcos (Hopkins St)",
        type: "grocery",
        address: "641 E Hopkins St, San Marcos, TX 78666",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.8834, longitude: -97.9302)
    ),
    PantryLocation(
        name: "Walmart Supercenter San Marcos",
        type: "grocery",
        address: "1015 Hwy 80, San Marcos, TX 78666",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.8878, longitude: -97.9142)
    ),
    PantryLocation(
        name: "H-E-B Elgin (S Hwy 95)",
        type: "grocery",
        address: "1080 Hwy 290 E, Elgin, TX 78621",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3479, longitude: -97.3514)
    ),
    PantryLocation(
        name: "Walmart Supercenter Taylor",
        type: "grocery",
        address: "3701 N Main St, Taylor, TX 76574",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5985, longitude: -97.4124)
    ),
    PantryLocation(
        name: "H-E-B Kingsland",
        type: "grocery",
        address: "511 Hwy 1431, Kingsland, TX 78639",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6582, longitude: -98.4415)
    ),
    PantryLocation(
        name: "Llano Food Pantry",
        type: "pantry",
        address: "1110 Berry St, Llano, TX 78643",
        hours: "Fri: 9 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.7512, longitude: -98.6824)
    ),
    PantryLocation(
        name: "Mason Food Pantry",
        type: "pantry",
        address: "411 Moody St, Mason, TX 76856",
        hours: "Mon: 3 PM - 5 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.7495, longitude: -99.2281)
    ),
    PantryLocation(
        name: "Blanco Good Samaritan Food Pantry",
        type: "pantry",
        address: "620 Pecan St, Blanco, TX 78606",
        hours: "Fri: 10 AM - 2 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.0968, longitude: -98.4234)
    ),
    PantryLocation(
        name: "Helping Hands of Georgetown",
        type: "pantry",
        address: "102 Church St, Georgetown, TX 78626",
        hours: "Sun: 3:30 PM - 5 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6321, longitude: -97.6742)
    ),
    PantryLocation(
        name: "The Common Good Food Pantry",
        type: "pantry",
        address: "1401 N Lampasas St, Round Rock, TX 78664",
        hours: "Sat: 9 AM - 11:30 AM",
        coordinate: CLLocationCoordinate2D(latitude: 30.5212, longitude: -97.6684)
    ),
    PantryLocation(
        name: "Central Texas Halal Market",
        type: "halal",
        address: "1100 Grand Avenue Pkwy, Pflugerville, TX 78660",
        hours: "Mon–Sun: 10 AM – 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4612, longitude: -97.6741)
    ),
    PantryLocation(
        name: "Casa de Luz (Gluten-Free Friendly Whole Food)",
        type: "Gluten-Free",
        address: "201 S Adams St, Fredericksburg, TX 78624",
        hours: "Daily: 11 AM – 8 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2715, longitude: -98.8772)
    ),
    PantryLocation(
        name: "The Vegan Nom (San Marcos Outpost)",
        type: "vegan",
        address: "300 N LBJ Dr, San Marcos, TX 78666",
        hours: "Tue–Sun: 9 AM – 8 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.8841, longitude: -97.9408)
    ),
    PantryLocation(
        name: "Arlo's Junior",
        type: "vegan",
        address: "2337 E Cesar Chavez St, Austin, TX 78702",
        hours: "Mon-Thu: 12 PM - 11 PM, Fri-Sat: 12 PM - 12:45 AM, Sun: 12 PM - 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2541, longitude: -97.7168)
    ),
    PantryLocation(
        name: "Bouldin Creek Cafe",
        type: "vegetarian",
        address: "1900 S 1st St, Austin, TX 78704",
        hours: "Mon-Sun: 8 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2476, longitude: -97.7554)
    ),
    PantryLocation(
        name: "Citizen All Day",
        type: "vegetarian",
        address: "4818 Burnet Rd Ste 600, Austin, TX 78756",
        hours: "Mon-Sun: 7 AM - 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3197, longitude: -97.7391)
    ),
    PantryLocation(
        name: "The Halal Corner",
        type: "halal",
        address: "1200 W 26th St, Austin, TX 78705",
        hours: "Mon-Sun: 11 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2917, longitude: -97.7468)
    ),
    PantryLocation(
        name: "Abo Youssef Mediterranean Catering",
        type: "halal",
        address: "2101 Manor Rd, Austin, TX 78722",
        hours: "Mon-Sun: 11 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2839, longitude: -97.7191)
    ),
    PantryLocation(
        name: "Saffron Austin",
        type: "vegetarian",
        address: "3616 Far West Blvd #113, Austin, TX 78731",
        hours: "Mon-Sun: 11 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3548, longitude: -97.7562)
    ),
    PantryLocation(
        name: "Wild Wood Bakehouse",
        type: "Gluten-Free",
        address: "3016 Guadalupe St, Austin, TX 78705",
        hours: "Tue-Sat: 11 AM - 9 PM, Sun: 10 AM - 3 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2974, longitude: -97.7417)
    ),
    PantryLocation(
        name: "Picnik Burnet Road",
        type: "Gluten-Free",
        address: "4801 Burnet Rd, Austin, TX 78756",
        hours: "Mon-Sun: 7 AM - 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.3198, longitude: -97.7391)
    ),
    PantryLocation(
        name: "The Beer Plant",
        type: "vegan",
        address: "3110 Windsor Rd, Austin, TX 78703",
        hours: "Tue-Sun: 4 PM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2921, longitude: -97.7635)
    ),
    PantryLocation(
        name: "Gati Ice Cream",
        type: "vegan",
        address: "1512 Holly St, Austin, TX 78702",
        hours: "Mon-Sun: 11 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2524, longitude: -97.7241)
    ),
    PantryLocation(
        name: "Asiana Indian Cuisine",
        type: "vegetarian",
        address: "801 E William Cannon Dr #205, Austin, TX 78745",
        hours: "Wed-Mon: 11 AM - 9:30 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.1982, longitude: -97.7714)
    ),
    PantryLocation(
        name: "Kismet Cafe",
        type: "halal",
        address: "1000 E 41st St #200, Austin, TX 78751",
        hours: "Mon-Sun: 10 AM - 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2998, longitude: -97.7185)
    ),
    PantryLocation(
        name: "Lil' Nonna's Vegan Pizza",
        type: "vegan",
        address: "440 E St Elmo Rd A-1, Austin, TX 78745",
        hours: "Tue-Sun: 4 PM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2148, longitude: -97.7612)
    ),
    PantryLocation(
        name: "Thai Fresh",
        type: "Gluten-Free",
        address: "909 W Mary St, Austin, TX 78704",
        hours: "Mon-Sun: 9 AM - 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2452, longitude: -97.7594)
    ),
    PantryLocation(
        name: "Nadam Restaurant",
        type: "vegetarian",
        address: "13343 US-183 #250, Austin, TX 78750",
        hours: "Tue-Sun: 11:30 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4468, longitude: -97.7994)
    ),
    PantryLocation(
        name: "Aster's Ethiopian Restaurant",
        type: "vegetarian",
        address: "2801 IH-35 Frontage Rd, Austin, TX 78722",
        hours: "Tue-Sun: 11 AM - 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2905, longitude: -97.7226)
    ),
    PantryLocation(
        name: "Plow Burger",
        type: "vegan",
        address: "1505 Town Creek Dr, Austin, TX 78741",
        hours: "Mon-Sun: 11 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2435, longitude: -97.7268)
    ),
    PantryLocation(
        name: "Shandeez Mediterranean Grill",
        type: "halal",
        address: "11508 Palmway Ln, Austin, TX 78759",
        hours: "Mon-Sun: 11 AM - 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.4182, longitude: -97.7471)
    ),
    PantryLocation(
        name: "Kelly Center for Hunger Relief",
        type: "pantry",
        address: "915 N Florence St, El Paso, TX 79902",
        hours: "Tue-Fri: 9 AM - 2 PM, Sat: 9 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 31.7672, longitude: -106.4861)
    ),
    PantryLocation(
        name: "South Plains Food Bank",
        type: "pantry",
        address: "5605 MLK Blvd, Lubbock, TX 79404",
        hours: "Mon-Fri: 8 AM - 5 PM",
        coordinate: CLLocationCoordinate2D(latitude: 33.5358, longitude: -101.8152)
    ),
    PantryLocation(
        name: "Plantaqueria",
        type: "vegan",
        address: "124 Broadway, San Antonio, TX 78205",
        hours: "Mon-Sun: 7 AM - 4 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.4268, longitude: -98.4884)
    ),
    PantryLocation(
        name: "High Plains Food Bank",
        type: "pantry",
        address: "815 Ross St, Amarillo, TX 79102",
        hours: "Mon-Fri: 8 AM - 12 PM & 1 PM - 5 PM",
        coordinate: CLLocationCoordinate2D(latitude: 35.2012, longitude: -101.8541)
    ),
    PantryLocation(
        name: "Food Bank of the Rio Grande Valley",
        type: "pantry",
        address: "724 N Cage Blvd, Pharr, TX 78577",
        hours: "Mon-Thu: 7:30 AM - 4 PM, Fri: 7:30 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 26.2052, longitude: -98.1834)
    ),
    PantryLocation(
        name: "West Texas Food Bank",
        type: "pantry",
        address: "411 Page Ave, Lyndale, TX 79762",
        hours: "Mon-Thu: 8 AM - 4 PM, Fri: 8 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 31.8594, longitude: -102.3485)
    ),
    PantryLocation(
        name: "Project HORIZON Food Bank",
        type: "pantry",
        address: "1002 Sam Houston Ave, Huntsville, TX 77340",
        hours: "Mon-Wed: 9 AM - 1 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.7225, longitude: -95.5501)
    ),
    PantryLocation(
        name: "Costco Wholesale El Paso",
        type: "grocery",
        address: "6101 Gateway Blvd W, El Paso, TX 79925",
        hours: "Mon-Fri: 10 AM - 8:30 PM, Sat: 9:30 AM - 6 PM, Sun: 10 AM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 31.7841, longitude: -106.3952)
    ),
    PantryLocation(
        name: "Walmart Supercenter Marfa",
        type: "grocery",
        address: "2200 US-67, Fort Stockton, TX 79735",
        hours: "Mon-Sun: 6 AM - 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.8845, longitude: -102.8951)
    ),
    PantryLocation(
        name: "H-E-B Corpus Christi",
        type: "grocery",
        address: "5313 Saratoga Blvd, Corpus Christi, TX 78413",
        hours: "Mon-Sun: 6 AM - 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 27.6892, longitude: -97.3994)
    ),
    PantryLocation(
        name: "Lubbock Impact Food Pantry",
        type: "pantry",
        address: "2707 34th St, Lubbock, TX 79410",
        hours: "Mon: 5 PM - 6:30 PM, Thu: 9:30 AM - 11:30 AM",
        coordinate: CLLocationCoordinate2D(latitude: 33.5654, longitude: -101.8719)
    ),
    PantryLocation(
        name: "Tumerico (Texas Border Market Outpost)",
        type: "vegan",
        address: "411 N Zaragoza Rd, El Paso, TX 79907",
        hours: "Wed-Sat: 11 AM - 8 PM, Sun: 11 AM - 4 PM",
        coordinate: CLLocationCoordinate2D(latitude: 31.6841, longitude: -106.3214)
    ),
    PantryLocation(
        name: "Revolución Coffee + Juice",
        type: "vegetarian",
        address: "7959 Broadway St #500, San Antonio, TX 78209",
        hours: "Mon-Sun: 7 AM - 7 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.5105, longitude: -98.4614)
    ),
    PantryLocation(
        name: "The Greener Bar",
        type: "vegan",
        address: "1603 San Jacinto Blvd, Austin, TX 78701",
        hours: "Tue-Sun: 12 PM - 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.2762, longitude: -97.7321)
    ),
    PantryLocation(
        name: "Zest Fest (Pure Veg Selection)",
        type: "vegetarian",
        address: "4321 Texas Ave, College Station, TX 77840",
        hours: "Mon-Sat: 11 AM - 9 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.6185, longitude: -96.3214)
    ),
    PantryLocation(
        name: "Halal Market San Antonio",
        type: "halal",
        address: "8524 Wurzbach Rd, San Antonio, TX 78240",
        hours: "Mon-Sun: 9 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.5189, longitude: -98.5614)
    ),
    PantryLocation(
        name: "Sweet Mustard Gluten-Free Bakery",
        type: "Gluten-Free",
        address: "1800 McRae Blvd, El Paso, TX 79925",
        hours: "Tue-Sat: 9 AM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 31.7915, longitude: -106.3541)
    ),
    PantryLocation(
        name: "Abilene Food Bank",
        type: "pantry",
        address: "5505 N 1st St, Abilene, TX 79603",
        hours: "Mon-Fri: 8 AM - 4:30 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.4491, longitude: -99.7824)
    ),
    PantryLocation(
        name: "Wichita Falls Area Food Bank",
        type: "pantry",
        address: "1230 Central Fwy, Wichita Falls, TX 76306",
        hours: "Mon-Fri: 8 AM - 5 PM",
        coordinate: CLLocationCoordinate2D(latitude: 33.9214, longitude: -98.4912)
    ),
    PantryLocation(
        name: "Texarkana Resources Food Pantry",
        type: "pantry",
        address: "3011 E 19th St, Texarkana, TX 75501",
        hours: "Mon-Fri: 8 AM - 4 PM",
        coordinate: CLLocationCoordinate2D(latitude: 33.4352, longitude: -94.0142)
    ),
    PantryLocation(
        name: "Galveston County Food Bank",
        type: "pantry",
        address: "213 6th St N, Texas City, TX 77590",
        hours: "Mon-Thu: 8 AM - 4 PM, Fri: 8 AM - 3 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.3941, longitude: -94.9054)
    ),
    PantryLocation(
        name: "Laredo Regional Food Bank",
        type: "pantry",
        address: "2801 Anna Ave, Laredo, TX 78040",
        hours: "Mon-Fri: 8 AM - 12 PM & 1 PM - 5 PM",
        coordinate: CLLocationCoordinate2D(latitude: 27.5254, longitude: -99.4912)
    ),
    PantryLocation(
        name: "H-E-B McAllen",
        type: "grocery",
        address: "3601 N 10th St, McAllen, TX 78501",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 26.2348, longitude: -98.2312)
    ),
    PantryLocation(
        name: "Walmart Supercenter Beaumont",
        type: "grocery",
        address: "4145 Dowlen Rd, Beaumont, TX 77706",
        hours: "Mon–Sun: 6 AM – 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.1142, longitude: -94.1612)
    ),
    PantryLocation(
        name: "Costco Wholesale Lubbock",
        type: "grocery",
        address: "6020 34th St, Lubbock, TX 79407",
        hours: "Mon-Fri: 10 AM - 8:30 PM, Sat: 9:30 AM - 6 PM, Sun: 10 AM - 6 PM",
        coordinate: CLLocationCoordinate2D(latitude: 33.5645, longitude: -101.9385)
    ),
    PantryLocation(
        name: "Food Bank of West Central Texas",
        type: "pantry",
        address: "5505 N 1st St, Abilene, TX 79603",
        hours: "Mon-Fri: 8 AM - 5 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.4492, longitude: -99.7821)
    ),
    PantryLocation(
        name: "Concho Valley Food Bank",
        type: "pantry",
        address: "1313 S Hill St, San Angelo, TX 76903",
        hours: "Mon-Fri: 8 AM - 12 PM & 1 PM - 4 PM",
        coordinate: CLLocationCoordinate2D(latitude: 31.4481, longitude: -100.4342)
    ),
    PantryLocation(
        name: "Spiral Diner & Bakery",
        type: "vegan",
        address: "1314 W Magnolia Ave, Fort Worth, TX 76104",
        hours: "Mon-Sun: 11 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.7305, longitude: -97.3391)
    ),
    PantryLocation(
        name: "The Green Seed Vegan",
        type: "vegan",
        address: "4322 Almeda Rd, Houston, TX 77004",
        hours: "Mon-Sun: 11 AM - 8 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.7289, longitude: -95.3784)
    ),
    PantryLocation(
        name: "Unrefined Bakery",
        type: "Gluten-Free",
        address: "4311 Oak Lawn Ave, Dallas, TX 75219",
        hours: "Mon-Sat: 9 AM - 6 PM, Sun: 11 AM - 4 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.8185, longitude: -96.8042)
    ),
    PantryLocation(
        name: "Halal Grill Amarillo",
        type: "halal",
        address: "3410 I-40 W, Amarillo, TX 79102",
        hours: "Mon-Sun: 11 AM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 35.1912, longitude: -101.8794)
    ),
    PantryLocation(
        name: "Madras Pavilion",
        type: "vegetarian",
        address: "16260 Kensington Dr, Sugar Land, TX 77479",
        hours: "Tue-Sun: 11:30 AM - 3 PM & 5:30 PM - 10 PM",
        coordinate: CLLocationCoordinate2D(latitude: 29.5968, longitude: -95.6214)
    ),
    PantryLocation(
        name: "Southeast Texas Food Bank",
        type: "pantry",
        address: "3845 S MLK Jr拆 Blvd, Beaumont, TX 77705",
        hours: "Mon-Fri: 8 AM - 4 PM",
        coordinate: CLLocationCoordinate2D(latitude: 30.0489, longitude: -94.0952)
    ),
    PantryLocation(
        name: "South Texas Food Bank",
        type: "pantry",
        address: "2121 Philip Ave, Laredo, TX 78043",
        hours: "Mon-Fri: 8 AM - 5 PM",
        coordinate: CLLocationCoordinate2D(latitude: 27.4912, longitude: -99.4795)
    ),
    PantryLocation(
        name: "Tyler Food Pantry",
        type: "pantry",
        address: "424 W Front St, Tyler, TX 75702",
        hours: "Tue & Thu: 9 AM - 12 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.3514, longitude: -95.3054)
    ),
    PantryLocation(
        name: "H-E-B Midland",
        type: "grocery",
        address: "3325 W Wadley Ave, Midland, TX 79707",
        hours: "Mon-Sun: 6 AM - 11 PM",
        coordinate: CLLocationCoordinate2D(latitude: 32.0195, longitude: -102.1241)
    ),
    PantryLocation(
        name: "Brazosport Cares Food Pantry",
        type: "pantry",
        address: "916 N Dixie Dr, Clute, TX 77531",
        hours: "Tue & Thu: 9 AM - 11:30 AM",
        coordinate: CLLocationCoordinate2D(latitude: 29.0254, longitude: -95.3992)
    ),
    PantryLocation(
        name: "Senior Center Food Bank",
        type: "pantry",
        address: "505 W Avenue G, San Angelo, TX 76903",
        hours: "Wed: 1 PM - 3 PM",
        coordinate: CLLocationCoordinate2D(latitude: 31.4512, longitude: -100.4491)
    ) 
]

