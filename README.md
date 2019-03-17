# uiimage-assets
*uiimage-assets.sh* is a script for generating `UIImages` in `swift` file from `Xcode` `AssetsName.xcassets` directory. Generated file contains an `extension` on `UIImage` with static `vars` for all image sets located in `AssetsName.xcassets` directory. It could be  useful when a large number of new image sets are added in a project and we want to avoid using pure strings throughout a project.

## Usage
1. add permission for script execution: *chmod +x uiimage_assets.sh*

2. run script: *./uiimage_assets.sh*

3. **Enter file directory path:** - path to directory where generated file will be located

4. **Enter file name:** - name of generated `swift` file

5. **Enter full Assets directory path:** - full path to Xcode Assets directory *(*.xcassets)*

## Example
This is the input flow for the example project:
```
$: chmod +x uiimage_assets.sh
$: ./uiimage-assets.sh
$: Enter file directory path: UIImageAssetsExample/UIImageAssetsExample/Utilities
$: Enter file name: UIImage+Assets.swift
$: Enter full Assets directory path: UIImageAssetsExample/UIImageAssetsExample/Assets.xcassets
```
#### Generated file UIImage+Assets.swift:
With path: *UIImageAssetsExample/UIImageAssetsExample/Utilities/UIImage+Assets.swift*
```
import Foundation
import UIKit

extension UIImage {

	static var bora_bora: UIImage? {
		return UIImage(named: "bora_bora")
	}

	static var lake: UIImage? {
		return UIImage(named: "lake")
	}

	static var road: UIImage? {
		return UIImage(named: "road")
	}

	static var sunset: UIImage? {
		return UIImage(named: "sunset")
	}

	static var tree: UIImage? {
		return UIImage(named: "tree")
	}
}
```
After the **UIImage+Assets.swif** file has been generated it must be added in Xcode project: *File -> Add Files to "ProjectName"* or right click on directory tree and choose *Add Files to "ProjectName"*.

Now, images can be used like this:
```
firstImageView.image = UIImage.bora_bora
secondImageView.image = UIImage.sunset
```

## License

uiimage-assets is available under the MIT license. See the [LICENSE](https://github.com/MatijaKruljac/uiimage-assets/blob/master/LICENSE) file for more info.
