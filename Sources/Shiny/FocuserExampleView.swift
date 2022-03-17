//
//  FocuserExampleView.swift
//
//
//  Created by Lawrence Tran on 3/17/22.
//

import SwiftUI
import Focuser

enum FormFields {
    case username, password, name
}

extension FormFields: FocusStateCompliant {

    static var last: FormFields {
        .name
    }

    var next: FormFields? {
        switch self {
        case .username:
            return .password
        case .password:
            return .name
        default: return nil
        }
    }
}

struct FocuserExampleView: View {
    @FocusStateLegacy var focusedField: FormFields?
    @State var username = ""
    @State var password = ""
    @State var name = ""

    var body: some View {
        VStack{
            TextField("Username", text: $username)
                .focusedLegacy($focusedField, equals: .username)

            TextField("Password", text: $password)
                .focusedLegacy($focusedField, equals: .password)

            TextField("Name", text: $name)
                .focusedLegacy($focusedField, equals: .name)

            Button(action: {
                focusedField = FormFields.password
            }) {
                Text("Focus Password")
            }
        }
        .padding()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FocuserExampleView()
    }
}
