import SwiftUI

struct NumberSettingsView: View {
    @Binding var settings: NumberSettings

    var body: some View {
        Section("Number Settings") {
            Picker("Max Number Size", selection: $settings.maxNumber) {
                ForEach([12, 15, 20, 30], id: \.self) { size in
                    Text("Up to \(size)")
                }
            }

            Toggle("Allow Decimals", isOn: $settings.allowsDecimals)
                .disabled(settings.fractionType == .properOnly)
                .foregroundColor(settings.fractionType == .properOnly ? .gray : .primary)

            if settings.fractionType == .properOnly && settings.allowsDecimals {
                Text("Decimals will be between 0 and 1")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Toggle("Enable Fractions", isOn: Binding(
                get: { settings.fractionType != nil },
                set: { settings.fractionType = $0 ? .properOnly : nil }
            ))

            if settings.fractionType != nil {
                Picker("Fraction Type", selection: Binding(
                    get: { settings.fractionType ?? .properOnly },
                    set: { settings.fractionType = $0 }
                )) {
                    ForEach(NumberSettings.FractionType.allCases) { type in // And here
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(.segmented)
            }

            Toggle("Allow Negatives", isOn: $settings.allowsNegatives)
        }
    }
}
