//
//  ContentView.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                // ViewBuilder supports only no more than 10 static views in one container.
                NavigationLink(destination: ViewListOne()) {
                    Text("ViewListOne")
                }
                NavigationLink(destination: ViewListTwo()) {
                    Text("ViewListTwo")
                }
                NavigationLink(destination: ViewListThree()) {
                    Text("ViewListThree")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ViewListOne: View {
    var body: some View {
        Form {
            Section(header: Text("Button")) {
                NavigationLink(destination: BasicButton()) {
                    Text("BasicButton")
                }
                NavigationLink(destination: ListButton()) {
                    Text("ListButton")
                }
                NavigationLink(destination: ContextMenuButton()) {
                    Text("ContextMenuButton")
                }
                NavigationLink(destination: StylingButton()) {
                    Text("StylingButton")
                }
            }
            .textCase(nil)

            Section(header: Text("ColorPicker")) {
                NavigationLink(destination: BasicColorPicker()) {
                    Text("BasicColorPicker")
                }
            }
            .textCase(nil)

            Section(header: Text("DatePicker")) {
                NavigationLink(destination: BasicDatePicker()) {
                    Text("BasicDatePicker")
                }
                NavigationLink(destination: RangeDatePicker()) {
                    Text("RangeDatePicker")
                }
                NavigationLink(destination: StylingDatePicker()) {
                    Text("StylingDatePicker")
                }
            }
            .textCase(nil)

            Section(header: Text("DisclosureGroup")) {
                NavigationLink(destination: BasicDisclosureGroup()) {
                    Text("BasicDisclosureGroup")
                }
            }
            .textCase(nil)

            Section(header: Text("EditButton")) {
                NavigationLink(destination: BasicEditButton()) {
                    Text("BasicEditButton")
                }
            }
            .textCase(nil)

            Section(header: Text("Form")) {
                NavigationLink(destination: BasicForm()) {
                    Text("BasicForm")
                }
            }
            .textCase(nil)

            Section(header: Text("GroupBox")) {
                NavigationLink(destination: BasicGroupBox()) {
                    Text("BasicGroupBox")
                }
            }
            .textCase(nil)

            Section(header: Text("Label")) {
                NavigationLink(destination: BasicLabel()) {
                    Text("BasicLabel")
                }
                NavigationLink(destination: StylingLabel()) {
                    Text("StylingLabel")
                }
                NavigationLink(destination: GroupStylingLabel()) {
                    Text("GroupStylingLabel")
                }
                NavigationLink(destination: ProgrammableLabel()) {
                    Text("ProgrammableLabel")
                }
            }
            .textCase(nil)

            Section(header: Text("Link")) {
                NavigationLink(destination: BasicLink()) {
                    Text("BasicLink")
                }
            }
            .textCase(nil)

            Section(header: Text("List")) {
                NavigationLink(destination: BasicList()) {
                    Text("BasicList")
                }
                NavigationLink(destination: SelectionList()) {
                    Text("SelectionList")
                }
                NavigationLink(destination: HierachicalList()) {
                    Text("HierachicalList")
                }
                NavigationLink(destination: StylingList()) {
                    Text("StylingList")
                }
            }
            .textCase(nil)

        }
        .navigationTitle("ViewListOne")
    }
}

struct ViewListTwo: View {
    var body: some View {
        Form {
            Section(header: Text("NavigationLink")) {
                NavigationLink(destination: BasicNavigationLink()) {
                    Text("BasicNavigationLink")
                }
            }
            .textCase(nil)

            Section(header: Text("OutlineGroup")) {
                NavigationLink(destination: BasicOutlineGroup()) {
                    Text("BasicOutlineGroup")
                }
            }
            .textCase(nil)

            Section(header: Text("Picker")) {
                NavigationLink(destination: BasicPicker()) {
                    Text("BasicPicker")
                }
                NavigationLink(destination: IteratingPicker()) {
                    Text("IteratingPicker")
                }
                NavigationLink(destination: StylingPicker()) {
                    Text("StylingPicker")
                }
            }
            .textCase(nil)

            Section(header: Text("ProgressView")) {
                NavigationLink(destination: BasicProgressView()) {
                    Text("BasicProgressView")
                }
                NavigationLink(destination: StylingProgressView()) {
                    Text("StylingProgressView")
                }
            }
            .textCase(nil)

            Section(header: Text("ScrollView")) {
                NavigationLink(destination: BasicScrollView()) {
                    Text("BasicScrollView")
                }
            }
            .textCase(nil)

            Section(header: Text("Section")) {
                NavigationLink(destination: BasicSection()) {
                    Text("BasicSection")
                }
            }
            .textCase(nil)

            Section(header: Text("SecureField")) {
                NavigationLink(destination: BasicSecureField()) {
                    Text("BasicSecureField")
                }
            }
            .textCase(nil)

            Section(header: Text("Slider")) {
                NavigationLink(destination: BasicSlider()) {
                    Text("BasicSlider")
                }
                NavigationLink(destination: StepSlider()) {
                    Text("StepSlider")
                }
            }
            .textCase(nil)

            Section(header: Text("Stepper")) {
                NavigationLink(destination: BasicStepper()) {
                    Text("BasicStepper")
                }
            }
            .textCase(nil)

            Section(header: Text("TabView")) {
                NavigationLink(destination: BasicTabView()) {
                    Text("BasicTabView")
                }
                NavigationLink(destination: SelectionTabView()) {
                    Text("SelectionTabView")
                }
            }
            .textCase(nil)

        }
        .navigationTitle("ViewListTwo")
    }
}

struct ViewListThree: View {
    var body: some View {
        Form {
            Section(header: Text("Text")) {
                NavigationLink(destination: BasicText()) {
                    Text("BasicText")
                }                }
                .textCase(nil)

            Section(header: Text("TextEditor")) {
                NavigationLink(destination: BasicTextEditor()) {
                    Text("BasicTextEditor")
                }
            }
            .textCase(nil)

            Section(header: Text("TextField")) {
                NavigationLink(destination: BasicTextField()) {
                    Text("BasicTextField")
                }
            }
            .textCase(nil)

            Section(header: Text("Toggle")) {
                NavigationLink(destination: BasicToggle()) {
                    Text("BasicToggle")
                }
                NavigationLink(destination: StylingToggle()) {
                    Text("StylingToggle")
                }
            }
            .textCase(nil)
        }
        .navigationTitle("ViewListThree")
    }
}
