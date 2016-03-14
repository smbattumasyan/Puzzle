//
//  PuzzleViewController.m
//  Puzzle
//
//  Created by Smbat Tumasyan on 3/10/16.
//  Copyright © 2016 EGS. All rights reserved.
//

#import "PuzzleViewController.h"

@interface NSPoint : NSObject

@property (assign, nonatomic) CGPoint point;
- (BOOL)isEqual:(CGPoint)point;
- (instancetype)initWithPoint:(CGPoint)point;

@end

@implementation NSPoint


- (instancetype)initWithPoint:(CGPoint)point
{
    self = [super init];
    if (self) {
        self.point = point;
    }
    return self;
}



- (BOOL)isEqual:(CGPoint)point
{
    if (self.point.x == point.x && self.point.y == point.y) {
        return YES;
    }
    return NO;
}

@end

@interface PuzzleViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (weak, nonatomic ) IBOutlet UIView      *deskView;

@property (strong, nonatomic) NSPoint *freePlace;
@property (strong, nonatomic) UIImage *cropImage;
@property (weak, nonatomic) IBOutlet UIButton *openButton;


@property (strong, nonatomic) UIImageView *firstImage;
@property (strong, nonatomic) UIImageView *secondImage;
@property (strong, nonatomic) UIImageView *thirdImage;
@property (strong, nonatomic) UIImageView *fourthImage;
@property (strong, nonatomic) UIImageView *fifthImage;
@property (strong, nonatomic) UIImageView *sixthImage;
@property (strong, nonatomic) UIImageView *seventhImage;
@property (strong, nonatomic) UIImageView *eightImage;
@property (strong, nonatomic) UIImageView *ninthImage;

@property (strong, nonatomic) NSPoint *firstPlace;
@property (strong, nonatomic) NSPoint *secondPlace;
@property (strong, nonatomic) NSPoint *thirdPlace;
@property (strong, nonatomic) NSPoint *fourthPlace;
@property (strong, nonatomic) NSPoint *fifthPlace;
@property (strong, nonatomic) NSPoint *sixthPlace;
@property (strong, nonatomic) NSPoint *seventhPlace;
@property (strong, nonatomic) NSPoint *eightPlace;
@property (strong, nonatomic) NSPoint *ninthPlace;


@end

@implementation PuzzleViewController

//------------------------------------------------------------------------------------------
#pragma mark - Life Cyrcle
//------------------------------------------------------------------------------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.deskView.hidden = YES;
    [self setupPlaces];
//    [self setupImageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Handle touchesMoved
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    if([touch view] == self.firstImage)
    {
        [self moveImage:self.firstImage];
    } else if ([touch view] == self.secondImage) {
        [self moveImage:self.secondImage];
    }else if ([touch view] == self.thirdImage) {
        [self moveImage:self.thirdImage];
    }else if ([touch view] == self.fourthImage) {
        [self moveImage:self.fourthImage];
    }else if ([touch view] == self.fifthImage) {
        [self moveImage:self.fifthImage];
    }else if ([touch view] == self.sixthImage) {
        [self moveImage:self.sixthImage];
    }else if ([touch view] == self.seventhImage) {
        [self moveImage:self.seventhImage];
    }else if ([touch view] == self.eightImage) {
        [self moveImage:self.eightImage];
    }
    
    NSLog(@"touch!");
}

//------------------------------------------------------------------------------------------
#pragma mark - IBOuntlets Actions
//------------------------------------------------------------------------------------------

- (IBAction)openImageButton:(UIButton *)sender {
    [self setupImagePicker];
}

//------------------------------------------------------------------------------------------
#pragma mark - Privete Methods
//------------------------------------------------------------------------------------------

- (void)moveImage:(UIImageView *)imageView
{
    //first
    if ([[self ImagePlace:imageView] isEqual:self.firstPlace.point]) {
        if ([self.freePlace isEqual:self.secondPlace.point]) {
            imageView.center = self.secondPlace.point;
            self.freePlace   = self.firstPlace;
        } else if ([self.freePlace isEqual:self.fourthPlace.point]) {
            imageView.center = self.fourthPlace.point;
            self.freePlace   = self.firstPlace;
        }
        //third
    } else if ([[self ImagePlace:imageView] isEqual:self.thirdPlace.point]) {
        if ([self.freePlace isEqual:self.secondPlace.point]) {
            imageView.center = self.secondPlace.point;
            self.freePlace   = self.thirdPlace;
        } else if ([self.freePlace isEqual:self.sixthPlace.point]) {
            imageView.center = self.sixthPlace.point;
            self.freePlace   = self.thirdPlace;
        }
        //seven
    } else if ([[self ImagePlace:imageView] isEqual:self.seventhPlace.point]) {
        if ([self.freePlace isEqual:self.eightPlace.point]) {
            imageView.center = self.eightPlace.point;
            self.freePlace   = self.seventhPlace;
        } else if ([self.freePlace isEqual:self.fourthPlace.point]) {
            imageView.center = self.fourthPlace.point;
            self.freePlace   = self.seventhPlace;
        }
        //ninth
    } else if ([[self ImagePlace:imageView] isEqual:self.ninthPlace.point]) {
        if ([self.freePlace isEqual:self.eightPlace.point]) {
            imageView.center = self.eightPlace.point;
            self.freePlace   = self.ninthPlace;
        } else if ([self.freePlace isEqual:self.sixthPlace.point]) {
            imageView.center = self.sixthPlace.point;
            self.freePlace   = self.ninthPlace;
        }
        //second
    } else if ([[self ImagePlace:imageView] isEqual:self.secondPlace.point]) {
        if ([self.freePlace isEqual:self.firstPlace.point]) {
            imageView.center = self.firstPlace.point;
            self.freePlace   = self.secondPlace;
        } else if ([self.freePlace isEqual:self.thirdPlace.point]) {
            imageView.center = self.thirdPlace.point;
            self.freePlace   = self.secondPlace;
        } else if ([self.freePlace isEqual:self.fifthPlace.point]) {
            imageView.center = self.fifthPlace.point;
            self.freePlace   = self.secondPlace;
        }
        //fourth
    } else if ([[self ImagePlace:imageView] isEqual:self.fourthPlace.point]) {
        if ([self.freePlace isEqual:self.firstPlace.point]) {
            imageView.center = self.firstPlace.point;
            self.freePlace   = self.fourthPlace;
        } else if ([self.freePlace isEqual:self.seventhPlace.point]) {
            imageView.center = self.seventhPlace.point;
            self.freePlace   = self.fourthPlace;
        } else if ([self.freePlace isEqual:self.fifthPlace.point]) {
            imageView.center = self.fifthPlace.point;
            self.freePlace   = self.fourthPlace;
        }
        //sixth
    } else if ([[self ImagePlace:imageView] isEqual:self.sixthPlace.point]) {
        if ([self.freePlace isEqual:self.ninthPlace.point]) {
            imageView.center = self.ninthPlace.point;
            self.freePlace   = self.sixthPlace;
        } else if ([self.freePlace isEqual:self.thirdPlace.point]) {
            imageView.center = self.thirdPlace.point;
            self.freePlace   = self.sixthPlace;
        } else if ([self.freePlace isEqual:self.fifthPlace.point]) {
            imageView.center = self.fifthPlace.point;
            self.freePlace   = self.sixthPlace;
        }
        //eighth
    } else if ([[self ImagePlace:imageView] isEqual:self.eightPlace.point]) {
        if ([self.freePlace isEqual:self.ninthPlace.point]) {
            imageView.center = self.ninthPlace.point;
            self.freePlace   = self.eightPlace;
        } else if ([self.freePlace isEqual:self.seventhPlace.point]) {
            imageView.center = self.seventhPlace.point;
            self.freePlace   = self.eightPlace;
        } else if ([self.freePlace isEqual:self.fifthPlace.point]) {
            imageView.center = self.fifthPlace.point;
            self.freePlace   = self.eightPlace;
        }
        //five
    } else if ([[self ImagePlace:imageView] isEqual:self.fifthPlace.point]) {
        if ([self.freePlace isEqual:self.secondPlace.point]) {
            imageView.center = self.secondPlace.point;
            self.freePlace   = self.fifthPlace;
        } else if ([self.freePlace isEqual:self.eightPlace.point]) {
            imageView.center = self.eightPlace.point;
            self.freePlace   = self.fifthPlace;
        } else if ([self.freePlace isEqual:self.fourthPlace.point]) {
            imageView.center = self.fourthPlace.point;
            self.freePlace   = self.fifthPlace;
        } else if ([self.freePlace isEqual:self.sixthPlace.point]) {
            imageView.center = self.sixthPlace.point;
            self.freePlace   = self.fifthPlace;
        }
    }
}

- (NSPoint *)ImagePlace:(UIImageView *)imageView
{
    if ([self.firstPlace isEqual:imageView.center]) {
        return self.firstPlace;
    } else if ([self.secondPlace isEqual:imageView.center]) {
        return self.secondPlace;
    } else if ([self.thirdPlace isEqual:imageView.center]) {
        return self.thirdPlace;
    } else if ([self.fourthPlace isEqual:imageView.center]) {
        return self.fourthPlace;
    } else if ([self.fifthPlace isEqual:imageView.center]) {
        return self.fifthPlace;
    } else if ([self.sixthPlace isEqual:imageView.center]) {
        return self.sixthPlace;
    } else if ([self.seventhPlace isEqual:imageView.center]) {
        return self.seventhPlace;
    } else if ([self.eightPlace isEqual:imageView.center]) {
        return self.eightPlace;
    } else if ([self.ninthPlace isEqual:imageView.center]) {
        return self.ninthPlace;
    }
    return self.freePlace;
}

- (UIImageView *)createImage:(UIImage *)image point:(CGPoint)point
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.userInteractionEnabled = YES;
    imageView.frame = CGRectMake(0, 0, 100, 100);
    imageView.center = point;
    [imageView.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [imageView.layer setBorderWidth: 1.0];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(45, 45, 14, 14)];
    if ([self.firstPlace isEqual:point]) {
        label.text = @"1";
    } else if ([self.secondPlace isEqual:point]) {
        label.text = @"2";
    } else if ([self.thirdPlace isEqual:point]) {
        label.text = @"3";
    } else if ([self.fourthPlace isEqual:point]) {
        label.text = @"4";
    } else if ([self.fifthPlace isEqual:point]) {
        label.text = @"5";
    } else if ([self.sixthPlace isEqual:point]) {
        label.text = @"6";
    } else if ([self.seventhPlace isEqual:point]) {
        label.text = @"7";
    } else if ([self.eightPlace isEqual:point]) {
        label.text = @"8";
    } else {
        label.text = @"";
    }
    
    
    [imageView addSubview:label];
    return imageView;
}


- (void)setupImageView
{
    self.firstImage   = [self createImage:[self getSubImageFrom:self.cropImage WithRect:CGRectMake(0, 0, 100, 100)] point:self.firstPlace.point];
    [self.deskView addSubview:self.firstImage];
    
    self.secondImage  = [self createImage:[self getSubImageFrom:self.cropImage WithRect:CGRectMake(100, 0, 100, 100)] point:self.secondPlace.point];
    [self.deskView addSubview:self.secondImage];

    self.thirdImage   = [self createImage:[self getSubImageFrom:self.cropImage WithRect:CGRectMake(200, 0, 100, 100)] point:self.thirdPlace.point];
    [self.deskView addSubview:self.thirdImage];

    self.fourthImage  = [self createImage:[self getSubImageFrom:self.cropImage WithRect:CGRectMake(0, 100, 100, 100)] point:self.fourthPlace.point];
    [self.deskView addSubview:self.fourthImage];

    self.fifthImage   = [self createImage:[self getSubImageFrom:self.cropImage WithRect:CGRectMake(100, 100, 100, 100)] point:self.fifthPlace.point];
    [self.deskView addSubview:self.fifthImage];

    self.sixthImage   = [self createImage:[self getSubImageFrom:self.cropImage WithRect:CGRectMake(200, 100, 100, 100)] point:self.sixthPlace.point];
    [self.deskView addSubview:self.sixthImage];

    self.seventhImage = [self createImage:[self getSubImageFrom:self.cropImage WithRect:CGRectMake(0, 200, 100, 100)] point:self.seventhPlace.point];
    [self.deskView addSubview:self.seventhImage];

    self.eightImage   = [self createImage:[self getSubImageFrom:self.cropImage WithRect:CGRectMake(100, 200, 100, 100)] point:self.eightPlace.point];
    [self.deskView addSubview:self.eightImage];

//    self.ninthImage   = [self createImage:[self getSubImageFrom:self.cropImage WithRect:CGRectMake(200, 200, 100, 100)] point:self.ninthPlace.point imageNumber:@(9)];
    
    self.freePlace = [[NSPoint alloc] initWithPoint:self.ninthPlace.point];
    
    [self.deskView addSubview:self.ninthImage];
}

- (void)setupPlaces
{
    self.firstPlace   = [[NSPoint alloc] initWithPoint:CGPointMake(50, 50)];
    self.secondPlace  = [[NSPoint alloc] initWithPoint:CGPointMake(150, 50)];
    self.thirdPlace   = [[NSPoint alloc] initWithPoint:CGPointMake(250, 50)];
    self.fourthPlace  = [[NSPoint alloc] initWithPoint:CGPointMake(50, 150)];
    self.fifthPlace   = [[NSPoint alloc] initWithPoint:CGPointMake(150, 150)];
    self.sixthPlace   = [[NSPoint alloc] initWithPoint:CGPointMake(250, 150)];
    self.seventhPlace = [[NSPoint alloc] initWithPoint:CGPointMake(50, 250)];
    self.eightPlace   = [[NSPoint alloc] initWithPoint:CGPointMake(150, 250)];
    self.ninthPlace   = [[NSPoint alloc] initWithPoint:CGPointMake(250, 250)];
}

- (UIImage*) getSubImageFrom: (UIImage*) img WithRect: (CGRect) rect {
    
    img = [self imageWithImage:img scaledToSize:CGSizeMake(300, 300)];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // translated rectangle for drawing sub image
    CGRect drawRect = CGRectMake(-rect.origin.x, -rect.origin.y, img.size.width, img.size.height);
    
    // clip to the bounds of the image context
    // not strictly necessary as it will get clipped anyway?
    CGContextClipToRect(context, CGRectMake(0, 0, rect.size.width, rect.size.height));
    
    // draw image
    [img drawInRect:drawRect];
    
    // grab image
    UIImage* subImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return subImage;
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)setupImagePicker
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

// This method is called when an image has been chosen from the library or taken from the camera.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //You can retrieve the actual UIImage
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    //Or you can get the image url from AssetsLibrary
//    NSURL *path = [info valueForKey:UIImagePickerControllerReferenceURL];

    self.cropImage = image;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    self.deskView.hidden = NO;
    self.openButton.hidden = YES;
    [self setupImageView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
