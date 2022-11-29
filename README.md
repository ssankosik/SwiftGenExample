# SwiftGenExample
Example project using SwiftGen

## Requirements
- SwiftGen >= 6.4.0

## Author
sasawat.sankosik@gmail.com

## License
SwiftGenExample is available under the MIT license. See the LICENSE file for more info.

## Operator details
**Assets**   
```swift
view.background = AppAssets.Color.Primary.accent.color
logoImageView.image = AppAssets.Image.logo.image
```

**Fonts**   
```swift
label.font = AppFonts.SukhumvitSet.text.font(size: 16)
```

**L10n**     
```swift
label.text = L10n.Common.ok.localized()
label.text = L10n.Parameter.description("First", 2, 3.0)
```
