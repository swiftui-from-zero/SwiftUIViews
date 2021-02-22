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
                ControlSection()
                LayoutSection()
                PaintsSection()
                OtherSection()
            }
            .navigationTitle("SwiftUIViews")
        }
    }
}

// MARK: Control
struct ControlSection: View {
    var body: some View {
        Section(header: Text("Controls")) {
            NavigationLink(destination: ControlListOne()) {
                Text("Button ... List")
            }
            NavigationLink(destination: ControlListTwo()) {
                Text("NavigationLink ... TabView")
            }
            NavigationLink(destination: ControlListThree()) {
                Text("Text ... Toggle")
            }
        }
    }
}

struct ControlListOne: View {
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
                NavigationLink(destination: CustomEditButton()) {
                    Text("CustomEditButton")
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
        .navigationTitle("Button ... List")
    }
}

struct ControlListTwo: View {
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
        .navigationTitle("NavigationLink ... TabView")
    }
}

struct ControlListThree: View {
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
        .navigationTitle("Text ... Toggle")
    }
}

// MARK: Layout
struct LayoutSection: View {
    var body: some View {
        Section(header: Text("Layout")) {
            NavigationLink(
                destination: LayoutList(),
                label: {
                    Text("GeometryReader ... ZStack")
                })
        }
    }
}

struct LayoutList: View {
    var body: some View {
        Form {
            Section(header: Text("GeometryReader")) {
                NavigationLink(destination: BasicGeometryReader()) {
                    Text("BasicGeometryReader")
                }
                NavigationLink(destination: SafeAreaGeometryReader()) {
                    Text("SafeAreaGeometryReader")
                }
                NavigationLink(destination: FrameGeometryReader()) {
                    Text("FrameGeometryReader")
                }
            }
            .textCase(nil)

            Section(header: Text("HStack")) {
                NavigationLink(destination: BasicHStack()) {
                    Text("BasicHStack")
                }
                NavigationLink(destination: LayerPriorityBasicHStack()) {
                    Text("LayerPriorityBasicHStack")
                }
            }
            .textCase(nil)

            Section(header: Text("LazyHStack")) {
                NavigationLink(destination: BasicLazyHStack()) {
                    Text("BasicLazyHStack")
                }
            }
            .textCase(nil)

            Section(header: Text("LazyVStack")) {
                NavigationLink(destination: BasicLazyVStack()) {
                    Text("BasicLazyVStack")
                }
            }
            .textCase(nil)

            Section(header: Text("ScrollViewReader")) {
                NavigationLink(destination: BasicScrollViewReader()) {
                    Text("BasicScrollViewReader")
                }
            }
            .textCase(nil)

            Section(header: Text("Spacer")) {
                NavigationLink(destination: BasicSpacer()) {
                    Text("BasicSpacer")
                }
            }
            .textCase(nil)

            Section(header: Text("VStack")) {
                NavigationLink(destination: BasicVStack()) {
                    Text("BasicVStack")
                }
                NavigationLink(destination: LayerPriorityBasicVStack()) {
                    Text("LayerPriorityBasicVStack")
                }
            }
            .textCase(nil)
            
            Section(header: Text("ZStack")) {
                NavigationLink(destination: BasicZStack()) {
                    Text("BasicZStack")
                }
                NavigationLink(destination: IgnoreSafeZStack()) {
                    Text("IgnoreSafeZStack")
                }
                NavigationLink(destination: ZIndexZStack()) {
                    Text("ZIndexZStack")
                }
            }
            .textCase(nil)
        }
        .navigationTitle("GeometryReader ... ZStack")
    }
}

// MARK: Paints
struct PaintsSection: View {
    var body: some View {
        Section(header: Text("Paints")) {
            NavigationLink(
                destination: PaintsList(),
                label: {
                    Text("Angular ... Radial")
                })
        }
    }
}

struct PaintsList: View {
    var body: some View {
        Form {
            Section(header: Text("AngularGradient")) {
                NavigationLink(destination: BasicAngularGradient()) {
                    Text("BasicAngularGradient")
                }
            }
            .textCase(nil)

            Section(header: Text("LinearGradient")) {
                NavigationLink(destination: BasicLinearGradient()) {
                    Text("BasicLinearGradient")
                }
            }
            .textCase(nil)

            Section(header: Text("RadialGradient")) {
                NavigationLink(destination: BasicRadialGradient()) {
                    Text("RadialGradient")
                }
            }
            .textCase(nil)
        }
        .navigationTitle("Angular ... Radial")
    }
}

// MARK: Other
struct OtherSection: View {
    var body: some View {
        Section(header: Text("Other")) {
            NavigationLink(
                destination: OtherList(),
                label: {
                    Text("Menu")
                })
        }
    }
}

struct OtherList: View {
    var body: some View {
        Form {
            Section(header: Text("Menu")) {
                NavigationLink(destination: BasicMenu()) {
                    Text("BasicMenu")
                }
                NavigationLink(destination: StylingMenu()) {
                    Text("StylingMenu")
                }
            }
            .textCase(nil)
        }
        .navigationTitle("Menu")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
