//
//  PuzzleViewController.m
//  Puzzle
//
//  Created by Smbat Tumasyan on 3/10/16.
//  Copyright © 2016 EGS. All rights reserved.
//

#import "PuzzleViewController.h"

@interface PuzzleViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (weak, nonatomic ) IBOutlet UIView      *deskView;

@property (nonatomic,retain) UIImageView *firstImage;
@property (nonatomic,retain) UIImageView *secondImage;
@property (nonatomic,retain) UIImageView *thirdImage;
@property (nonatomic,retain) UIImageView *fourthImage;
@property (nonatomic,retain) UIImageView *fifthImage;
@property (nonatomic,retain) UIImageView *sixthImage;
@property (nonatomic,retain) UIImageView *seventhImage;
@property (nonatomic,retain) UIImageView *eightImage;
@property (nonatomic,retain) UIImageView *ninthImage;


@end

@implementation PuzzleViewController

//------------------------------------------------------------------------------------------
#pragma mark - Life Cyrcle
//------------------------------------------------------------------------------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setupImageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Handle touchesMoved
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch!");
    UITouch *touch = [[event allTouches] anyObject];
    if([touch view]==self.firstImage)
    {
        CGPoint location      = [touch locationInView:self.deskView];
        static int i = 1;
        self.firstImage.frame = CGRectMake(i = i + 5, self.firstImage.frame.origin.y, 100, 100);
    } else if ([touch view]==self.secondImage) {
        CGPoint location        = [touch locationInView:self.deskView];
        self.secondImage.center = location;
    }
}

//------------------------------------------------------------------------------------------
#pragma mark - IBOuntlets Actions
//------------------------------------------------------------------------------------------

- (IBAction)openImageButton:(UIButton *)sender {
}

//------------------------------------------------------------------------------------------
#pragma mark - IBOuntlets Actions
//------------------------------------------------------------------------------------------

- (UIImageView *)createImage:(UIImage *)image frame:(CGRect)frame
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.userInteractionEnabled = YES;
    imageView.frame = frame;
    return imageView;
}

- (void)setupImageView
{
    self.firstImage = [self createImage:[UIImage imageNamed:@"image"] frame:CGRectMake(0, 0, 100, 100)];
    [self.deskView addSubview:self.firstImage];
    
    self.secondImage = [self createImage:[UIImage imageNamed:@"image"] frame:CGRectMake(self.firstImage.bounds.size.width, 0, 100, 100)];
    [self.deskView addSubview:self.secondImage];
    
    self.thirdImage = [self createImage:[UIImage imageNamed:@"image"] frame:CGRectMake(self.firstImage.bounds.size.width*2, 0, 100, 100)];
    [self.deskView addSubview:self.thirdImage];
    
    self.fourthImage = [self createImage:[UIImage imageNamed:@"image"] frame:CGRectMake(0, self.firstImage.bounds.size.height, 100, 100)];
    [self.deskView addSubview:self.fourthImage];
    
    self.fifthImage = [self createImage:[UIImage imageNamed:@"image"] frame:CGRectMake(self.firstImage.bounds.size.width, self.firstImage.bounds.size.height*2, 100, 100)];
    [self.deskView addSubview:self.fifthImage];
    
    self.sixthImage = [self createImage:[UIImage imageNamed:@"image"] frame:CGRectMake(self.firstImage.bounds.size.width*2, self.firstImage.bounds.size.height, 100, 100)];
    [self.deskView addSubview:self.sixthImage];
    
    self.seventhImage = [self createImage:[UIImage imageNamed:@"image"] frame:CGRectMake(0, self.firstImage.bounds.size.height*2, 100, 100)];
    [self.deskView addSubview:self.seventhImage];
    
    self.eightImage = [self createImage:[UIImage imageNamed:@"image"] frame:CGRectMake(self.firstImage.bounds.size.width, self.firstImage.bounds.size.height, 100, 100)];
    [self.deskView addSubview:self.eightImage];
    
//    self.ninthImage = [self createImage:[UIImage imageNamed:@"image"] frame:CGRectMake(self.firstImage.bounds.size.width*2, self.firstImage.bounds.size.height*2, 100, 100)];
//    [self.deskView addSubview:self.ninthImage];
}

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
