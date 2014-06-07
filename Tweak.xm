/*

I know my code isn't the nicest, but it works :P

- Dekesto

*/
static UIButton *button;
static UITextField *field;

%hook SBSearchHeader 

 - (void)layoutSubviews {

 	%orig;
 	button = MSHookIvar<UIButton *>(self, "_cancelButton");
 	field = MSHookIvar<UITextField *>(self, "_searchField");
 	field.frame = CGRectMake(field.frame.origin.x,field.frame.origin.y,304,30);
 	button.hidden = YES; 

 }

%end

%hook SBSearchViewController

- (void)_searchFieldEditingChanged {

	%orig;
	UIView *header = MSHookIvar<UIView *>(self, "_searchHeader");
	button = MSHookIvar<UIButton *>(header, "_cancelButton");
 	field = MSHookIvar<UITextField *>(header, "_searchField");
	NSUInteger count = [field.text length];
 	if (count > 0) {

		[UIView animateWithDuration:0.2 animations:^{ 

			field.frame = CGRectMake(field.frame.origin.x,field.frame.origin.y,238,30);
 		

  		}completion:^(BOOL finished){ 

  			button.hidden = NO;

  		}];

 	} else if (count == 0){

		[UIView animateWithDuration:0.2 animations:^{ 

			field.frame = CGRectMake(field.frame.origin.x,field.frame.origin.y,304,30);
 			button.hidden = YES;

  		}completion:^(BOOL finished){ 
  			//nothing to be done
  		}];
			
 	}

}

%end