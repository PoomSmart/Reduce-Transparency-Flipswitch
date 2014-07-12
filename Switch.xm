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
//com.apple.accessibility.cache.enhance.background.contrast
- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSSetEnhanceBackgroundContrastEnabled(newState == FSSwitchStateOn);
}

@end