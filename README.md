# DKFilterView

[![CI Status](http://img.shields.io/travis/Drinking/DKFilterView.svg?style=flat)](https://travis-ci.org/Drinking/DKFilterView)
[![Version](https://img.shields.io/cocoapods/v/DKFilterView.svg?style=flat)](http://cocoadocs.org/docsets/DKFilterView)
[![License](https://img.shields.io/cocoapods/l/DKFilterView.svg?style=flat)](http://cocoadocs.org/docsets/DKFilterView)
[![Platform](https://img.shields.io/cocoapods/p/DKFilterView.svg?style=flat)](http://cocoadocs.org/docsets/DKFilterView)

## Screenshot
![image](https://raw.githubusercontent.com/drinking/DKFilterView/master/demo.gif)

## Usage
Init your DKFilterView by constucting a DKFilterModel which contains your own selection value. 
There are three types,`DK_SELECTION_SINGLE`,`DK_SELECTION_MULTIPLE` and `DK_SELECTION_PICK`.
Run Demo to see each's behavior.

```objc
NSArray *filterData =  @[@"Apple",@"Pear",@"Mango",@"Orange",@"Lychee",@"Coconut"];
DKFilterModel *model = [[DKFilterModel alloc] initElement:filterData ofType:DK_SELECTION_SINGLE];
model.title = @"Click";
model.style = DKFilterViewStyle1;
    
DKFilterView *filterView = [[DKFilterView alloc] initWithFrame:self.view.frame];
[self.view addSubview:filterView];
[filterView setFilterModels:@[model]];
```
###Customization

Implement `DKFilterViewDelegate` to customize your own header view or click behavior.

```objc
- (NSInteger)getCustomSectionHeaderHeight;
- (DKFilterSectionHeaderView *)getCustomSectionHeader;
- (void)didClickAtModel:(DKFilterModel *)data;
```

## Installation

To install it, simply add the following line to your Podfile:

    pod 'DKFilterView', :git => 'https://github.com/drinking/DKFilterView.git'

Since it's a beta version, DKFilterView now is not available through [CocoaPods](http://cocoapods.org). 

## Author

Drinking, pan49@126.com

## License

DKFilterView is available under the MIT license. See the LICENSE file for more info.

