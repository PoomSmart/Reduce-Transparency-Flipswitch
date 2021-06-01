#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"

@interface ContrastBGToggleSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" Boolean _AXSEnhanceBackgroundContrastEnabled();
extern "C" void _AXSSetEnhanceBackgroundContrastEnabled(BOOL enabled);

@implementation ContrastBGToggleSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSEnhanceBackgroundContrastEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSSetEnhanceBackgroundContrastEnabled(newState == FSSwitchStateOn);
}

- (void)applyAlternateActionForSwitchIdentifier:(NSString *)switchIdentifier
{
	NSURL *url = [NSURL URLWithString:(kCFCoreFoundationVersionNumber > 1665.0f ? @"prefs:root=ACCESSIBILITY&path=DISPLAY_AND_TEXT#REDUCE_TRANSPARENCY" : @"prefs:root=General&path=ACCESSIBILITY/ENHANCE_BACKGROUND_CONTRAST#REDUCE_TRANSPARENCY")];
	[[FSSwitchPanel sharedPanel] openURLAsAlternateAction:url];
}

@end
