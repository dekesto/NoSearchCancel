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

 	NSUInteger count = [field.text length];
 	CGPoint position = button.frame.origin;
 	CGSize size = button.frame.size;
 	
	if (count > 0) {

		[UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{ 

			field.frame = CGRectMake(field.frame.origin.x,field.frame.origin.y,238,30);
 			button.frame = CGRectMake(254,position.y, size.width, size.height);

  		}completion:NULL];

 	} else if (count == 0){

		[UIView animateWithDuration:0.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{ 

			field.frame = CGRectMake(field.frame.origin.x,field.frame.origin.y,304,30);
 			button.frame = CGRectMake(330,position.y, size.width, size.height);

  		}completion:NULL];
			
 	}

 }

%end

%hook SBSearchViewController

- (void)_searchFieldEditingChanged {

	%orig;
	UIView *header = MSHookIvar<UIView *>(self, "_searchHeader");
	button = MSHookIvar<UIButton *>(header, "_cancelButton");
 	field = MSHookIvar<UITextField *>(header, "_searchField");
	NSUInteger count = [field.text length];
	CGPoint position = button.frame.origin;
 	CGSize size = button.frame.size;
	
 	if (count > 0) {

		[UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{ 

			field.frame = CGRectMake(field.frame.origin.x,field.frame.origin.y,238,30);
 			button.frame = CGRectMake(254,position.y, size.width, size.height);

  		}completion:NULL];

 	} else if (count == 0){

		[UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{ 

			field.frame = CGRectMake(field.frame.origin.x,field.frame.origin.y,304,30);
 			button.frame = CGRectMake(330,position.y, size.width, size.height);


  		}completion:NULL];
			
 	}

}

%end