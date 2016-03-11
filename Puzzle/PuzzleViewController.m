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

@property (strong, nonatomic) NSPoint* freePlace;


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
    
    
    [self setupPlaces];
    [self setupImageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Handle touchesMoved
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

    UITouch *touch = [[event allTouches] anyObject];
    if([touch view] == self.eightImage)
    {
        NSLog(@"place%@",[self findImagePlace:self.eightImage]);
    }
    
    NSLog(@"touch!");
}

//------------------------------------------------------------------------------------------
#pragma mark - IBOuntlets Actions
//------------------------------------------------------------------------------------------

- (IBAction)openImageButton:(UIButton *)sender {
}

//------------------------------------------------------------------------------------------
#pragma mark - Privete Methods
//------------------------------------------------------------------------------------------

- (NSPoint *)findImagePlace:(UIImageView *)imageView
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
    return imageView;
}

- (void)setupImageView
{
   
    self.firstImage   = [self createImage:[UIImage imageNamed:@"image"] point:self.firstPlace.point];
    [self.deskView addSubview:self.firstImage];
    
    self.secondImage  = [self createImage:[UIImage imageNamed:@"image"] point:self.secondPlace.point];
    [self.deskView addSubview:self.secondImage];

    self.thirdImage   = [self createImage:[UIImage imageNamed:@"image"] point:self.thirdPlace.point];
    [self.deskView addSubview:self.thirdImage];

    self.fourthImage  = [self createImage:[UIImage imageNamed:@"image"] point:self.fourthPlace.point];
    [self.deskView addSubview:self.fourthImage];

    self.fifthImage   = [self createImage:[UIImage imageNamed:@"image"] point:self.fifthPlace.point];
    [self.deskView addSubview:self.fifthImage];

    self.sixthImage   = [self createImage:[UIImage imageNamed:@"image"] point:self.sixthPlace.point];
    [self.deskView addSubview:self.sixthImage];

    self.seventhImage = [self createImage:[UIImage imageNamed:@"image"] point:self.seventhPlace.point];
    [self.deskView addSubview:self.seventhImage];

    self.eightImage   = [self createImage:[UIImage imageNamed:@"image"] point:self.eightPlace.point];
    [self.deskView addSubview:self.eightImage];

//    self.ninthImage   = [self createImage:[UIImage imageNamed:@"image"] point:self.ninthPlace];
//    [self.deskView addSubview:self.ninthImage];
  
    self.freePlace = [[NSPoint alloc] initWithPoint:self.ninthPlace.point];
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

//
//- (void)setupImagePicker
//{
//    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
//    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    imagePickerController.delegate = self;
//    [self presentViewController:imagePickerController animated:YES completion:nil];
//}
//
//// This method is called when an image has been chosen from the library or taken from the camera.
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    //You can retrieve the actual UIImage
//    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
//    //Or you can get the image url from AssetsLibrary
//    NSURL *path = [info valueForKey:UIImagePickerControllerReferenceURL];
//    
//    
//    [picker dismissViewControllerAnimated:YES completion:nil];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
