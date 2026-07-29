//
//  NewCommunityPostView.swift
//
//
//import SwiftUI
//struct NewCommunityPostView: View {
//    
//    @Environment(\.dismiss) private var dismiss
//    
//    @Environment(\.userSession) var user
//    
//    var onPost: (CommunityPost) -> Void
//
//    // POST TYPE
//    enum PostType: String, CaseIterable {
//        case recipe = "Recipe"
//        case foodDrive = "Food Drive"
//        case advertisement = "Store Promotion"
//    }
//    
//    @State private var selectedType: PostType = .recipe
//    
//    // COMMON FIELDS
//    @State private var title = ""
//    @State private var description = ""
//    @State private var contactInfo = ""
//    
//    // RECIPE FIELDS
//    @State private var ingredients: [String] = []
//    @State private var steps: [String] = []
//    
//    // FOOD DRIVE FIELDS
//    @State private var volunteerInfo = ""
//    @State private var location = ""
//    @State private var mission = ""
//    
//    // STORE PROMOTION FIELDS
//    @State private var discountInfo = ""
//    @State private var storeLocation = ""
//    
//    // IMAGE
//    @State private var selectedImage: UIImage?
//    @State private var showImagePicker = false
//    
//    // INPUT FIELDS
//    @State private var newIngredient = ""
//    @State private var newStep = ""
//    
//    var body: some View {
//        NavigationStack {
//            ZStack{
//                
//                Theme.backColor
//                    .ignoresSafeArea()
//                
//                ScrollView {
//                    
//                    
//                    VStack(spacing: 20) {
//                        
//                        
//                        
//                        // POST TYPE PICKER
//                        Picker("Post Type", selection: $selectedType) {
//                            ForEach(PostType.allCases, id: \.self) { type in
//                                Text(type.rawValue)
//                            }
//                        }
//                        .pickerStyle(.segmented)
//                        .background(Theme.lightGreen)
//                        .cornerRadius(12)
//                        .padding()
//                        
//                        // TITLE
//                        TextField("Title", text: $title)
//                            .padding()
//                            .background(Color.white)
//                            .cornerRadius(12)
//                            .padding(.horizontal)
//                        
//                        // DESCRIPTION
//                        TextEditor(text: $description)
//                            .frame(minHeight: 100)
//                            .padding()
//                            .background(Color.white)
//                            .cornerRadius(12)
//                            .padding(.horizontal)
//                        
//                        // CONTACT
//                        TextField("Contact Info", text: $contactInfo)
//                            .padding()
//                            .background(Color.white)
//                            .cornerRadius(12)
//                            .padding(.horizontal)
//                        
//                        // RECIPE ONLY FIELDS
//                        if selectedType == .recipe {
//                            VStack(spacing: 12) {
//                                
//                                // INGREDIENTS
//                                VStack(alignment: .leading) {
//                                    Text("Ingredients")
//                                        .font(.headline)
//                                        .foregroundColor(.white)
//                                    
//                                    HStack {
//                                        TextField("Add ingredient", text: $newIngredient)
//                                            .textFieldStyle(.roundedBorder)
//                                        
//                                        Button("Add") {
//                                            let trimmed = newIngredient.trimmingCharacters(in: .whitespaces)
//                                            guard !trimmed.isEmpty else { return }
//                                            ingredients.append(trimmed)
//                                            newIngredient = ""
//                                        }
//                                        .padding(.horizontal)
//                                        .background(Theme.primaryGreen)
//                                        .foregroundColor(Theme.backColor)
//                                        .cornerRadius(8)
//                                        .disabled(newIngredient == "")
//                                        .opacity(newIngredient == "" ? 0.4 : 1.0)
//                                    }
//                                    
//                                    ForEach(ingredients, id: \.self) { item in
//                                        Text("• \(item)")
//                                            .foregroundColor(.white)
//                                    }
//                                }
//                                .padding(.horizontal)
//                                
//                                // STEPS
//                                VStack(alignment: .leading) {
//                                    Text("Directions")
//                                        .font(.headline)
//                                        .foregroundColor(.white)
//                                    
//                                    HStack {
//                                        TextField("Add step", text: $newStep)
//                                            .textFieldStyle(.roundedBorder)
//                                        
//                                        Button("Add") {
//                                            let trimmed = newStep.trimmingCharacters(in: .whitespaces)
//                                            guard !trimmed.isEmpty else { return }
//                                            steps.append(trimmed)
//                                            newStep = ""
//                                        }
//                                        .padding(.horizontal)
//                                        .background(Theme.primaryGreen)
//                                        .foregroundColor(Theme.backColor)
//                                        .cornerRadius(8)
//                                    }
//                                    
//                                    ForEach(steps.indices, id: \.self) { i in
//                                        Text("\(i+1). \(steps[i])")
//                                            .foregroundColor(.white)
//                                    }
//                                }
//                                .padding(.horizontal)
//                            }
//                        }
//                        
//                        // FOOD DRIVE ONLY FIELDS
//                        if selectedType == .foodDrive {
//                            VStack(spacing: 12) {
//                                
//                                TextField("Volunteer Responsibilities", text: $volunteerInfo)
//                                    .padding()
//                                    .background(Color.white)
//                                    .cornerRadius(12)
//                                    .padding(.horizontal)
//                                
//                                TextField("Location", text: $location)
//                                    .padding()
//                                    .background(Color.white)
//                                    .cornerRadius(12)
//                                    .padding(.horizontal)
//                                
//                                TextField("Mission / Goal", text: $mission)
//                                    .padding()
//                                    .background(Color.white)
//                                    .cornerRadius(12)
//                                    .padding(.horizontal)
//                            }
//                        }
//                        
//                        // STORE PROMOTION ONLY FIELDS
//                        if selectedType == .advertisement {
//                            VStack(spacing: 12) {
//                                
//                                TextField("Discount / Offer Details", text: $discountInfo)
//                                    .padding()
//                                    .background(Color.white)
//                                    .cornerRadius(12)
//                                    .padding(.horizontal)
//                                
//                                TextField("Store Location", text: $storeLocation)
//                                    .padding()
//                                    .background(Color.white)
//                                    .cornerRadius(12)
//                                    .padding(.horizontal)
//                            }
//                        }
//                        
//                        // IMAGE PICKER
//                        VStack(alignment: .leading) {
//                            Text("Image (Optional)")
//                                .foregroundColor(.white)
//                                .font(.headline)
//                                .padding(.horizontal)
//                            
//                            Button {
//                                showImagePicker = true
//                            } label: {
//                                if let img = selectedImage {
//                                    Image(uiImage: img)
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height: 150)
//                                        .cornerRadius(12)
//                                        .padding(.horizontal)
//                                } else {
//                                    ZStack {
//                                        RoundedRectangle(cornerRadius: 12)
//                                            .fill(Color.white.opacity(0.3))
//                                            .frame(height: 150)
//                                        
//                                        Text("Select Image")
//                                            .foregroundColor(.white)
//                                    }
//                                    .padding(.horizontal)
//                                }
//                            }
//                        }
//                        
//                        // POST BUTTON
//                        Button {
//                            postNewCommunityPost()
//                        } label: {
//                            Text("Post")
//                                .bold()
//                                .frame(maxWidth: .infinity)
//                                .padding()
//                                .background(canPost() ? Theme.primaryGreen : Color.gray)
//                                .foregroundColor(.white)
//                                .cornerRadius(14)
//                                .padding(.horizontal)
//                        }
//                        .disabled(!canPost())
//                    }
//                    .padding(.vertical)
//                }
//                .background(Theme.backColor.ignoresSafeArea())
//                .padding(.top)
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Button("Cancel") { dismiss() }
//                    }
//                }
//                .sheet(isPresented: $showImagePicker) {
//                    CameraOrPhotoPicker { image in
//                        selectedImage = image
//                    }
//                }
//                .navigationTitle("New Post")
//
//            }
//        }
//    }
//    
//    // CHECK IF POST IS VALID
//    private func canPost() -> Bool {
//        
//        if (selectedType == .recipe){
//            return !title.trimmingCharacters(in: .whitespaces).isEmpty &&
//            !description.trimmingCharacters(in: .whitespaces).isEmpty && !ingredients.isEmpty && !steps.isEmpty
//        }
//        return true
//    }
//    
//    // CREATE POST
//    private func postNewCommunityPost() {
//        
//        let postType: CommunityPostType
//        
//        switch selectedType {
//        case .recipe:
//            postType = .recipe
//        case .foodDrive:
//            postType = .foodDrive
//        case .advertisement:
//            postType = .advertisement
//        }
//        
//        let newPost = CommunityPost(
//            type: postType,
//            title: title,
//            description: description,
//            contactInfo: contactInfo,
//            image: selectedImage,
//            ingredients: selectedType == .recipe ? ingredients : nil,
//            steps: selectedType == .recipe ? steps : nil,
//            volunteerDetails: volunteerInfo,
//            driveLocation: location,
//            missionDescription: mission,
//            storeLocation: storeLocation,
//            discountDetails: discountInfo,
//            postedByPremium: true
//        )
//        
//        onPost(newPost)
//        dismiss()
//    }
//}






//
// NewCommunityPostView.swift
// FoodLens

//import SwiftUI
//struct NewCommunityPostView: View {
//    
//    @Environment(\.dismiss) private var dismiss
//    
//    @Environment(\.userSession) var user
//    
//    var onPost: (CommunityPost) -> Void
//    
//    // POST TYPE
//    enum PostType: String, CaseIterable {
//        case recipe = "Recipe"
//        case foodDrive = "Food Drive"
//        case advertisement = "Store Promotion"
//    }
//    
//    @State private var selectedType: PostType = .recipe
//    
//    // COMMON FIELDS
//    @State private var title = ""
//    @State private var description = ""
//    @State private var contactInfo = ""
//    
//    // RECIPE FIELDS
//    @State private var ingredients: [String] = []
//    @State private var steps: [String] = []
//    
//    // FOOD DRIVE FIELDS
//    @State private var volunteerInfo = ""
//    @State private var location = ""
//    @State private var mission = ""
//    
//    // STORE PROMOTION FIELDS
//    @State private var discountInfo = ""
//    @State private var storeLocation = ""
//    
//    // IMAGE
//    @State private var selectedImage: UIImage?
//    @State private var showImagePicker = false
//    
//    // INPUT FIELDS
//    @State private var newIngredient = ""
//    @State private var newStep = ""
//    
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                // MATCHED BACKGROUND
//                Theme.backColor
//                    .overlay(
//                        LinearGradient(
//                            colors: [
//                                Theme.primaryGreen.opacity(0.08),
//                                .clear,
//                                Theme.accentColor.opacity(0.08)
//                            ],
//                            startPoint: .topLeading,
//                            endPoint: .bottomTrailing
//                        )
//                    )
//                    .ignoresSafeArea()
//                
//                ScrollView {
//                    VStack(spacing: 22) {
//                        
//                        header
//                        
//                        postTypePicker
//                        
//                        conditionalFields
//                        
//                        mainFields
//                        
//                        imageSection
//                        
//                        postButton
//                    }
//                    .padding(.horizontal, 20)
//                    .padding(.bottom, 40)
//                }
//            }
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    closeButton
//                }
//            }
//            .sheet(isPresented: $showImagePicker) {
//                CameraOrPhotoPicker { selectedImage = $0 }
//            }
//        }
//    }
//    
//    func styledField(_ placeholder: String, text: Binding<String>) -> some View {
//        TextField(placeholder, text: text)
//            .padding()
//            .background(Color.white.opacity(0.95))
//            .cornerRadius(12)
//    }
//
//    func styledEditor(_ placeholder: String, text: Binding<String>) -> some View {
//        ZStack(alignment: .topLeading) {
//            if text.wrappedValue.isEmpty {
//                Text(placeholder)
//                    .foregroundColor(.gray)
//                    .padding(.top, 12)
//                    .padding(.leading, 10)
//            }
//            
//            TextEditor(text: text)
//                .frame(minHeight: 110)
//                .padding(6)
//        }
//        .background(Color.white.opacity(0.95))
//        .cornerRadius(12)
//    }
//    
//    // CREATE POST
//    private func postNewCommunityPost() {
//        
//        let postType: CommunityPostType
//        
//        switch selectedType {
//        case .recipe:
//            postType = .recipe
//        case .foodDrive:
//            postType = .foodDrive
//        case .advertisement:
//            postType = .advertisement
//        }
//        
//        let newPost = CommunityPost(
//            type: postType,
//            title: title,
//            description: description,
//            contactInfo: contactInfo,
//            image: selectedImage,
//            ingredients: selectedType == .recipe ? ingredients : nil,
//            steps: selectedType == .recipe ? steps : nil,
//            volunteerDetails: volunteerInfo,
//            driveLocation: location,
//            missionDescription: mission,
//            storeLocation: storeLocation,
//            discountDetails: discountInfo,
//            postedByPremium: true
//        )
//        
//        onPost(newPost)
//        dismiss()
//    }
//
//}
//
//private extension NewCommunityPostView{
//    
//    var mainFields: some View {
//        GlassCard {
//            VStack(spacing: 14) {
//                styledField("Title", text: $title)
//                styledEditor("Description", text: $description)
//                styledField("Contact Info", text: $contactInfo)
//            }
//        }
//    }
//    
//    var header: some View {
//        Text("Create Post")
//            .font(.system(size: 30, weight: .bold))
//            .foregroundStyle(
//                LinearGradient(
//                    colors: [Theme.primaryGreen, Theme.accentColor],
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing
//                )
//            )
//            .shadow(color: Theme.glowGreen, radius: 10)
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding(.top, 10)
//    }
//    
//    var postTypePicker: some View {
//        Picker("", selection: $selectedType) {
//            ForEach(PostType.allCases, id: \.self) {
//                Text($0.rawValue)
//            }
//        }
//        .pickerStyle(.segmented)
//        .padding(6)
//        .background(.ultraThinMaterial)
//        .clipShape(RoundedRectangle(cornerRadius: 14))
//        .overlay(
//            RoundedRectangle(cornerRadius: 14)
//                .stroke(Theme.lightGreen.opacity(0.4), lineWidth: 1)
//        )
//    }
//    
//    var conditionalFields: some View {
//        Group {
//            if selectedType == .recipe {
//                recipeSection
//            } else if selectedType == .foodDrive {
//                foodDriveSection
//            } else {
//                storeSection
//            }
//        }
//    }
//    
//    var recipeSection: some View {
//        GlassCard {
//            VStack(spacing: 16) {
//                listInput(title: "Ingredients", items: ingredients, newItem: $newIngredient) {
//                    ingredients.append($0)
//                }
//                
//                listInput(title: "Steps", items: steps, newItem: $newStep, numbered: true) {
//                    steps.append($0)
//                }
//            }
//        }
//    }
//    
//    var foodDriveSection: some View {
//        GlassCard {
//            VStack(spacing: 16) {
//                CustomField("Volunteer Responsibilities", text: $volunteerInfo)
//                CustomField("Location", text: $location)
//                CustomField("Mission", text: $mission)
//            }
//        }
//    }
//    
//    var storeSection: some View {
//        GlassCard {
//            VStack(spacing: 16) {
//                CustomField("Discount Details", text: $discountInfo)
//                CustomField("Store Location", text: $storeLocation)
//            }
//        }
//    }
//    
//    var imageSection: some View {
//        GlassCard {
//            VStack(alignment: .leading, spacing: 12) {
//                
//                Label("Image", systemImage: "photo")
//                    .foregroundColor(Theme.primaryGreen)
//                
//                Button {
//                    showImagePicker = true
//                } label: {
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 18)
//                            .fill(Color.white.opacity(0.1))
//                            .frame(height: 160)
//                        
//                        if let img = selectedImage {
//                            Image(uiImage: img)
//                                .resizable()
//                                .scaledToFill()
//                                .frame(height: 160)
//                                .clipShape(RoundedRectangle(cornerRadius: 18))
//                        } else {
//                            VStack {
//                                Image(systemName: "photo")
//                                Text("Tap to upload")
//                            }
//                            .foregroundColor(.white.opacity(0.7))
//                        }
//                    }
//                }
//            }
//        }
//    }
//    
//    var postButton: some View {
//        Button {
//            postNewCommunityPost()
//        } label: {
//            Text("Post")
//                .font(.headline)
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(Theme.greenGradient)
//                .foregroundColor(Theme.backColor)
//                .cornerRadius(16)
//                .shadow(color: Theme.glowGreen, radius: 10)
//        }
//        .disabled(!canPost())
//        .opacity(canPost() ? 1 : 0.5)
//    }
//    
//    var closeButton: some View {
//        Button(action: { dismiss() }) {
//            Image(systemName: "xmark")
//                .font(.system(size: 14, weight: .bold))
//                .foregroundColor(Theme.primaryGreen)
//                .padding(10)
//                .background(.ultraThinMaterial)
//                .clipShape(Circle())
//                .overlay(
//                    Circle()
//                        .stroke(Theme.primaryGreen.opacity(0.4), lineWidth: 1)
//                )
//        }
//    }
//    
//}
//
//struct CustomField: View {
//    let placeholder: String
//    @Binding var text: String
//
//    init(_ placeholder: String, text: Binding<String>) {
//        self.placeholder = placeholder
//        self._text = text
//    }
//
//    var body: some View {
//        TextField(placeholder, text: $text)
//            .padding()
//            .background(Color.white)
//            .cornerRadius(10)
//    }
//}
//
//struct GlassCard<Content: View>: View {
//    let content: Content
//    
//    init(@ViewBuilder content: () -> Content) {
//        self.content = content()
//    }
//    
//    var body: some View {
//        VStack {
//            content
//        }
//        .padding(18)
//        .background(
//            ZStack {
//                RoundedRectangle(cornerRadius: 22)
//                    .fill(.ultraThinMaterial)
//                
//                RoundedRectangle(cornerRadius: 22)
//                    .fill(Theme.lightGreen.opacity(0.12))
//                
//                RoundedRectangle(cornerRadius: 22)
//                    .stroke(Theme.lightGreen.opacity(0.4), lineWidth: 1)
//            }
//        )
//        .shadow(color: Theme.glowGreen.opacity(0.4), radius: 12)
//    }
//}
//
//extension NewCommunityPostView {
//    func listInput(
//        title: String,
//        items: [String],
//        newItem: Binding<String>,
//        numbered: Bool = false,
//        onAdd: @escaping (String) -> Void
//    ) -> some View {
//        VStack(alignment: .leading, spacing: 10) {
//
//            Text(title)
//                .font(.headline)
//                .foregroundColor(.white)
//
//            HStack {
//                TextField("Add \(title.lowercased())", text: newItem)
//                    .textFieldStyle(.roundedBorder)
//
//                Button("Add") {
//                    let trimmed = newItem.wrappedValue.trimmingCharacters(in: .whitespaces)
//                    guard !trimmed.isEmpty else { return }
//                    onAdd(trimmed)
//                    newItem.wrappedValue = ""
//                }
//            }
//
//            ForEach(items.indices, id: \.self) { i in
//                Text(numbered ? "\(i+1). \(items[i])" : "• \(items[i])")
//                    .foregroundColor(.white.opacity(0.9))
//            }
//        }
//    }
//
//    private func canPost() -> Bool {
//        !title.isEmpty && !description.isEmpty
//    }
//}




//
//import SwiftUI
//
//struct NewCommunityPostView: View {
//    
//    @Environment(\.dismiss) private var dismiss
//    @Environment(\.userSession) var user
//    
//    var onPost: (CommunityPost) -> Void
//    
//    enum PostType: String, CaseIterable {
//        case recipe = "Recipe"
//        case foodDrive = "Food Drive"
//        case advertisement = "Store Promotion"
//    }
//    
//    @State private var selectedType: PostType = .recipe
//    
//    @State private var title = ""
//    @State private var description = ""
//    @State private var contactInfo = ""
//    
//    @State private var ingredients: [String] = []
//    @State private var steps: [String] = []
//    
//    @State private var volunteerInfo = ""
//    @State private var location = ""
//    @State private var mission = ""
//    
//    @State private var discountInfo = ""
//    @State private var storeLocation = ""
//    
//    @State private var selectedImage: UIImage?
//    @State private var showImagePicker = false
//    
//    @State private var newIngredient = ""
//    @State private var newStep = ""
//    
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack(spacing: 20) {
//                    
//                    header
//                    
//                    postTypePicker
//                    
//                    mainInfoSection
//                    
//                    conditionalFields
//                    
//                    imageSection
//                    
//                    postButton
//                }
//                .padding()
//            }
//            .background(Theme.backColor.ignoresSafeArea())
//            .navigationTitle("New Post")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button("Cancel") { dismiss() }
//                }
//            }
//            .sheet(isPresented: $showImagePicker) {
//                CameraOrPhotoPicker { selectedImage = $0 }
//            }
//        }
//    }
//    
//    // CREATE POST
//    private func postNewCommunityPost() {
//        
//        let postType: CommunityPostType
//        
//        switch selectedType {
//        case .recipe:
//            postType = .recipe
//        case .foodDrive:
//            postType = .foodDrive
//        case .advertisement:
//            postType = .advertisement
//        }
//        
//        let newPost = CommunityPost(
//            type: postType,
//            title: title,
//            description: description,
//            contactInfo: contactInfo,
//            image: selectedImage,
//            ingredients: selectedType == .recipe ? ingredients : nil,
//            steps: selectedType == .recipe ? steps : nil,
//            volunteerDetails: volunteerInfo,
//            driveLocation: location,
//            missionDescription: mission,
//            storeLocation: storeLocation,
//            discountDetails: discountInfo,
//            postedByPremium: true
//        )
//        
//        onPost(newPost)
//        dismiss()
//    }
//}
//
//// MARK: - Sections
//private extension NewCommunityPostView {
//    
//    var header: some View {
//        Text("Create Community Post")
//            .font(.title2.bold())
//            .foregroundColor(.white)
//            .frame(maxWidth: .infinity, alignment: .leading)
//    }
//    
//    var postTypePicker: some View {
//        Picker("", selection: $selectedType) {
//            ForEach(PostType.allCases, id: \.self) {
//                Text($0.rawValue)
//            }
//        }
//        .pickerStyle(.segmented)
//        .padding(6)
//        .background(.ultraThinMaterial)
//        .cornerRadius(12)
//    }
//    
//    var mainInfoSection: some View {
//        CardView {
//            VStack(spacing: 16) {
//                
//                CustomField("Title", text: $title)
//                
//                CustomTextEditor("Description", text: $description)
//                
//                CustomField("Contact Info", text: $contactInfo)
//            }
//        }
//    }
//    
//    var conditionalFields: some View {
//        Group {
//            if selectedType == .recipe {
//                recipeSection
//            } else if selectedType == .foodDrive {
//                foodDriveSection
//            } else {
//                storeSection
//            }
//        }
//    }
//    
//    var recipeSection: some View {
//        CardView {
//            VStack(spacing: 16) {
//                listInput(
//                    title: "Ingredients",
//                    items: ingredients,
//                    newItem: $newIngredient
//                ) { ingredients.append($0) }
//                
//                listInput(
//                    title: "Steps",
//                    items: steps,
//                    newItem: $newStep,
//                    numbered: true
//                ) { steps.append($0) }
//            }
//        }
//    }
//    
//    var foodDriveSection: some View {
//        CardView {
//            VStack(spacing: 16) {
//                CustomField("Volunteer Responsibilities", text: $volunteerInfo)
//                CustomField("Location", text: $location)
//                CustomField("Mission", text: $mission)
//            }
//        }
//    }
//    
//    var storeSection: some View {
//        CardView {
//            VStack(spacing: 16) {
//                CustomField("Discount Details", text: $discountInfo)
//                CustomField("Store Location", text: $storeLocation)
//            }
//        }
//    }
//    
//    var imageSection: some View {
//        CardView {
//            VStack(alignment: .leading, spacing: 12) {
//                Text("Image")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                
//                Button {
//                    showImagePicker = true
//                } label: {
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 14)
//                            .fill(Color.white.opacity(0.1))
//                            .frame(height: 160)
//                        
//                        if let img = selectedImage {
//                            Image(uiImage: img)
//                                .resizable()
//                                .scaledToFill()
//                                .frame(height: 160)
//                                .clipShape(RoundedRectangle(cornerRadius: 14))
//                        } else {
//                            VStack {
//                                Image(systemName: "photo")
//                                    .font(.largeTitle)
//                                Text("Tap to upload")
//                            }
//                            .foregroundColor(.white.opacity(0.7))
//                        }
//                    }
//                }
//            }
//        }
//    }
//    
//    var postButton: some View {
//        Button {
//            postNewCommunityPost()
//        } label: {
//            Text("Post")
//                .font(.headline)
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(canPost() ? Theme.primaryGreen : .gray)
//                .cornerRadius(14)
//                .shadow(color: .black.opacity(0.2), radius: 5, y: 3)
//        }
//        .disabled(!canPost())
//    }
//}
//
//// MARK: - Components
//
//struct CardView<Content: View>: View {
//    let content: Content
//    
//    init(@ViewBuilder content: () -> Content) {
//        self.content = content()
//    }
//    
//    var body: some View {
//        VStack {
//            content
//        }
//        .padding()
//        .background(Color.white.opacity(0.08))
//        .cornerRadius(16)
//        .shadow(color: .black.opacity(0.15), radius: 8, y: 4)
//    }
//}
//
//struct CustomField: View {
//    let placeholder: String
//    @Binding var text: String
//    
//    init(_ placeholder: String, text: Binding<String>) {
//        self.placeholder = placeholder
//        self._text = text
//    }
//    
//    var body: some View {
//        TextField(placeholder, text: $text)
//            .padding()
//            .background(Color.white)
//            .cornerRadius(10)
//    }
//}
//
//struct CustomTextEditor: View {
//    let placeholder: String
//    @Binding var text: String
//    
//    init(_ placeholder: String, text: Binding<String>) {
//        self.placeholder = placeholder
//        self._text = text
//    }
//    
//    var body: some View {
//        ZStack(alignment: .topLeading) {
//            if text.isEmpty {
//                Text(placeholder)
//                    .foregroundColor(.gray)
//                    .padding(.top, 12)
//                    .padding(.leading, 8)
//            }
//            
//            TextEditor(text: $text)
//                .frame(minHeight: 100)
//                .padding(4)
//        }
//        .background(Color.white)
//        .cornerRadius(10)
//    }
//}
//
//// MARK: - Helpers
//
//extension NewCommunityPostView {
//    
//    func listInput(
//        title: String,
//        items: [String],
//        newItem: Binding<String>,
//        numbered: Bool = false,
//        onAdd: @escaping (String) -> Void
//    ) -> some View {
//        VStack(alignment: .leading, spacing: 10) {
//            
//            Text(title)
//                .font(.headline)
//                .foregroundColor(.white)
//            
//            HStack {
//                TextField("Add \(title.lowercased())", text: newItem)
//                    .textFieldStyle(.roundedBorder)
//                
//                Button("Add") {
//                    let trimmed = newItem.wrappedValue.trimmingCharacters(in: .whitespaces)
//                    guard !trimmed.isEmpty else { return }
//                    onAdd(trimmed)
//                    newItem.wrappedValue = ""
//                }
//            }
//            
//            ForEach(items.indices, id: \.self) { i in
//                Text(numbered ? "\(i+1). \(items[i])" : "• \(items[i])")
//                    .foregroundColor(.white.opacity(0.9))
//            }
//        }
//    }
//    
//    private func canPost() -> Bool {
//        !title.isEmpty && !description.isEmpty
//    }
//}



//
// NewCommunityPostView.swift
// FoodLens
//

import SwiftUI

struct NewCommunityPostView: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(\.userSession) var user

    var onPost: (CommunityPost) -> Void

    enum PostType: String, CaseIterable {
        case recipe      = "Recipe"
        case foodDrive   = "Food Drive"
        case advertisement = "Promotion"
    }

    @State private var selectedType: PostType = .recipe

    // Common
    @State private var title       = ""
    @State private var description = ""
    @State private var contactInfo = ""

    // Recipe
    @State private var ingredients: [String] = []
    @State private var steps:       [String] = []
    @State private var newIngredient = ""
    @State private var newStep       = ""

    // Food Drive
    @State private var volunteerInfo = ""
    @State private var location      = ""
    @State private var mission       = ""

    // Store Promotion
    @State private var discountInfo  = ""
    @State private var storeLocation = ""

    // Image
    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false

    var body: some View {
        NavigationStack {
            ZStack {
                Theme.backColor
                    .overlay(
                        LinearGradient(
                            colors: [
                                Theme.primaryGreen.opacity(0.06),
                                .clear,
                                Theme.accentColor.opacity(0.06)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        header
                        postTypePicker
                        mainFields
                        conditionalFields
                        imageSection
                        postButton
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 50)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    closeButton
                }
            }
            .sheet(isPresented: $showImagePicker) {
                CameraOrPhotoPicker { selectedImage = $0 }
            }
        }
    }

    // MARK: - Post Action

    private func postNewCommunityPost() {
        let postType: CommunityPostType
        switch selectedType {
        case .recipe:        postType = .recipe
        case .foodDrive:     postType = .foodDrive
        case .advertisement: postType = .advertisement
        }

        let newPost = CommunityPost(
            type: postType,
            title: title,
            description: description,
            contactInfo: contactInfo,
            image: selectedImage,
            ingredients: selectedType == .recipe ? ingredients : nil,
            steps:       selectedType == .recipe ? steps       : nil,
            volunteerDetails:   volunteerInfo,
            driveLocation:      location,
            missionDescription: mission,
            storeLocation:      storeLocation,
            discountDetails:    discountInfo,
            postedByPremium:    true
        )

        onPost(newPost)
        dismiss()
    }

    private func canPost() -> Bool {
        !title.isEmpty && !description.isEmpty
    }
}


private extension NewCommunityPostView {

    var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("New Post")
                .font(.system(size: 32, weight: .bold))
                .foregroundStyle(
                    Theme.primaryGreen
                )
                .shadow(color: Theme.glowGreen.opacity(0.6), radius: 10)

            Text("Share with the community")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.5))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 8)
    }

    var postTypePicker: some View {
        HStack(spacing: 0) {
            ForEach(PostType.allCases, id: \.self) { type in
                let isSelected = selectedType == type
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedType = type
                    }
                } label: {
                    Text(type.rawValue)
                        .font(.subheadline.weight(isSelected ? .semibold : .regular))
                        .foregroundColor(isSelected ? Theme.backColor : .white.opacity(0.6))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(
                            isSelected
                            ? Theme.primaryGreen.opacity(0.9)
                            : Color.clear
                        )
                        .cornerRadius(12)
                }
            }
        }
        .padding(5)
        .background(Theme.lightGreen.opacity(0.12))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Theme.lightGreen.opacity(0.3), lineWidth: 1)
        )
    }

    var mainFields: some View {
        DarkCard {
            VStack(alignment: .leading, spacing: 16) {

                DarkField("Post Title", text: $title, icon: "pencil")

                Divider().background(Theme.lightGreen.opacity(0.4))

                DarkEditor("Description", text: $description, icon: "text.alignleft")

                Divider().background(Theme.lightGreen.opacity(0.4))

                DarkField("Contact Info", text: $contactInfo, icon: "envelope")
            }
        }
    }

    var conditionalFields: some View {
        Group {
            switch selectedType {
            case .recipe:        recipeSection
            case .foodDrive:     foodDriveSection
            case .advertisement: storeSection
            }
        }
    }

    var recipeSection: some View {
        DarkCard {
            VStack(alignment: .leading, spacing: 20) {
                darkListInput(
                    title: "Ingredients",
                    icon: "leaf.fill",
                    items: ingredients,
                    newItem: $newIngredient
                ) { ingredients.append($0) }

                Divider().background(Theme.lightGreen.opacity(0.2))

                darkListInput(
                    title: "Steps",
                    icon: "checklist",
                    items: steps,
                    newItem: $newStep,
                    numbered: true
                ) { steps.append($0) }
            }
        }
    }

    var foodDriveSection: some View {
        DarkCard {
            VStack(alignment: .leading, spacing: 16) {
                DarkField("Volunteer Responsibilities", text: $volunteerInfo, icon: "person.3")
                Divider().background(Theme.lightGreen.opacity(0.2))
                DarkField("Location", text: $location, icon: "mappin.and.ellipse")
                Divider().background(Theme.lightGreen.opacity(0.2))
                DarkEditor("Mission Statement", text: $mission, icon: "heart.fill")
            }
        }
    }

    var storeSection: some View {
        DarkCard {
            VStack(alignment: .leading, spacing: 16) {
                DarkField("Store Location", text: $storeLocation, icon: "building.2")
                Divider().background(Theme.lightGreen.opacity(0.2))
                DarkEditor("Promotion Details", text: $discountInfo, icon: "tag.fill")
            }
        }
    }

    var imageSection: some View {
        DarkCard {
            VStack(alignment: .leading, spacing: 12) {
                Label("Photo", systemImage: "photo")
                    .font(.subheadline.weight(.semibold))
                    .foregroundColor(Theme.primaryGreen)

                Button {
                    showImagePicker = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Theme.lightGreen.opacity(0.08))
                            .frame(height: 160)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(
                                        Theme.primaryGreen.opacity(0.3),
                                        style: StrokeStyle(lineWidth: 1.5, dash: [6])
                                    )
                            )

                        if let img = selectedImage {
                            Image(uiImage: img)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 160)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        } else {
                            VStack(spacing: 8) {
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 28))
                                    .foregroundColor(Theme.primaryGreen.opacity(0.8))
                                Text("Add Photo")
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                        }
                    }
                }
            }
        }
    }

    var postButton: some View {
        Button {
            postNewCommunityPost()
        } label: {
            HStack(spacing: 10) {
                Image(systemName: "paperplane.fill")
                Text("Post to Community")
                    .font(.headline)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                canPost()
                ? LinearGradient(
                    colors: [Theme.primaryGreen, Theme.accentColor],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                  )
                : LinearGradient(
                    colors: [Theme.lightGreen.opacity(0.3), Theme.lightGreen.opacity(0.3)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                  )
            )
            .foregroundColor(canPost() ? Theme.backColor : .white.opacity(0.4))
            .cornerRadius(16)
            .shadow(color: canPost() ? Theme.glowGreen.opacity(0.5) : .clear, radius: 12)
        }
        .disabled(!canPost())
        .animation(.easeInOut(duration: 0.2), value: canPost())
    }

    var closeButton: some View {
        Button(action: { dismiss() }) {
            Image(systemName: "xmark")
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(Theme.primaryGreen)
                .padding(9)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Theme.primaryGreen.opacity(0.35), lineWidth: 1)
                )
        }
    }
}


struct DarkCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack { content }
            .padding(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 22).fill(Color(.black.opacity(0.3)))
                    RoundedRectangle(cornerRadius: 22).fill(Theme.lightGreen.opacity(0.10))
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(Theme.lightGreen.opacity(0.35), lineWidth: 1)
                }
            )
            .shadow(color: Theme.glowGreen.opacity(0.25), radius: 12)
    }
}

struct DarkField: View {
    let placeholder: String
    @Binding var text: String
    let icon: String

    init(_ placeholder: String, text: Binding<String>, icon: String) {
        self.placeholder = placeholder
        self._text       = text
        self.icon        = icon
    }

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 14))
                .foregroundColor(Theme.primaryGreen.opacity(0.8))
                .frame(width: 20)

            TextField(placeholder, text: $text)
                .font(.subheadline)
                .foregroundColor(.white)
                .tint(Theme.primaryGreen)
        }
        .padding(.vertical, 4)
    }
}

struct DarkEditor: View {
    let placeholder: String
    @Binding var text: String
    let icon: String

    init(_ placeholder: String, text: Binding<String>, icon: String) {
        self.placeholder = placeholder
        self._text       = text
        self.icon        = icon
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .font(.system(size: 14))
                    .foregroundColor(Theme.primaryGreen.opacity(0.8))
                    .frame(width: 20)

                Text(placeholder)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.45))
            }

            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text("Write something…")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.25))
                        .padding(.top, 8)
                        .padding(.leading, 4)
                }

                TextEditor(text: $text)
                    .frame(minHeight: 90)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .tint(Theme.primaryGreen)
                    .scrollContentBackground(.hidden)
                    .background(.clear)
            }
        }
    }
}

func darkListInput(
    title: String,
    icon: String,
    items: [String],
    newItem: Binding<String>,
    numbered: Bool = false,
    onAdd: @escaping (String) -> Void
) -> some View {
    VStack(alignment: .leading, spacing: 12) {

        Label(title, systemImage: icon)
            .font(.subheadline.weight(.semibold))
            .foregroundColor(Theme.primaryGreen)

        HStack(spacing: 10) {
            TextField("Add \(title.lowercased())…", text: newItem)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(Theme.lightGreen.opacity(0.1))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Theme.lightGreen.opacity(0.25), lineWidth: 1)
                )
                .foregroundColor(.white)
                .tint(Theme.primaryGreen)
                .font(.subheadline)

            Button {
                let trimmed = newItem.wrappedValue.trimmingCharacters(in: .whitespaces)
                guard !trimmed.isEmpty else { return }
                onAdd(trimmed)
                newItem.wrappedValue = ""
            } label: {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(Theme.primaryGreen)
            }
        }

        if !items.isEmpty {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(items.indices, id: \.self) { i in
                    HStack(alignment: .top, spacing: 10) {
                        if numbered {
                            Text("\(i + 1)")
                                .font(.caption.bold())
                                .foregroundColor(Theme.primaryGreen)
                                .frame(width: 22, height: 22)
                                .background(Theme.primaryGreen.opacity(0.15))
                                .clipShape(Circle())
                        } else {
                            Circle()
                                .fill(Theme.primaryGreen.opacity(0.6))
                                .frame(width: 6, height: 6)
                                .padding(.top, 6)
                        }

                        Text(items[i])
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.85))
                    }
                }
            }
            .padding(14)
            .background(Theme.lightGreen.opacity(0.08))
            .cornerRadius(12)
        }
    }
}


#Preview{
    NewCommunityPostView(onPost: { _ in })
}


