# uiimage-assets
*uiimage-assets.sh* is a script for generating `UIImages` in `swift` file from `Xcode` `Assets` directory. Generated file contains an `extension` on `UIImage` with static `vars` for all image sets located in `Assets.xcassets` directory. 

## Usage
1. add permission for script execution: *chmod +x uiimage_assets.sh*

2. run script: *./uiimage_assets.sh*

3. **enter project directory path or name** - if *uiimage_assets.sh* script is on the same level as project directory enter name of Xcode project, if *uiimage_assets.sh* script is on `Desktop` than enter project directory name which contains Xcode project, also path can be entered depending on directory structure

4. **enter project path or name** - enter name of project which contains all source files (Xcode project name)

5. **Do you want to save file in project group? (y/n) y** - saving generated file to Xcode group

5. **enter path for project group (optional)** - this is optional step and it determines in which Xcode group generated file will be added, if `n` is choosen generated file will be added to root directory of Xcode project

## Example
This is the input flow for the example project:
```
$: chmod +x uiimage_assets.sh
$: ./uiimage-assets.sh
$: Enter project directory path or name: UIImageAssetsExample
$: Enter project path or name: UIImageAssetsExample
$: Do you want to save file in project group? (y/n) n
```
#### Generated file UIImage+Assets.swift:
With path: *UIImageAssetsExample/UIImageAssetsExample/UIImage+Assets.swift*
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
After the **UIImage+Assets.swif** file has been generated it must be added in Xcode project: *File -> Add Files to "ProjectName"* or right click on directory tree and *Add Files to "ProjectName"*.

Now, images can be used like this:
```
firstImageView.image = UIImage.bora_bora
secondImageView.image = UIImage.sunset
```
