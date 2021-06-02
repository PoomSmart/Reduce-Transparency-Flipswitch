#import <Foundation/Foundation.h>
#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>
#import <version.h>

@interface ReduceTransparencySwitch : NSObject <FSSwitchDataSource>
@end

extern "C" Boolean _AXSEnhanceBackgroundContrastEnabled();
extern "C" void _AXSSetEnhanceBackgroundContrastEnabled(BOOL enabled);

@implementation ReduceTransparencySwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
	return _AXSEnhanceBackgroundContrastEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier {
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSSetEnhanceBackgroundContrastEnabled(newState == FSSwitchStateOn);
}

- (void)applyAlternateActionForSwitchIdentifier:(NSString *)switchIdentifier {
	NSURL *url = [NSURL URLWithString:IS_IOS_OR_NEWER(iOS_13_0) ? @"prefs:root=ACCESSIBILITY&path=DISPLAY_AND_TEXT#REDUCE_TRANSPARENCY" : @"prefs:root=General&path=ACCESSIBILITY/ENHANCE_BACKGROUND_CONTRAST#REDUCE_TRANSPARENCY"];
	[[FSSwitchPanel sharedPanel] openURLAsAlternateAction:url];
}

@end
