#import "BBWeeAppController-Protocol.h"

#define VIEW_HEIGHT 176.0f

static NSBundle *_NCAmeshKobeWeeAppBundle = nil;

@interface NCAmeshKobeViewController : NSObject <BBWeeAppController>
{
    UIView *_view;
    UIImageView *_backgroundView;
    UIWebView *_webView;
}
@property (nonatomic, retain) UIView *view;
@end

@implementation NCAmeshKobeViewController
@synthesize view = _view;

+ (void)initialize
{
    _NCAmeshKobeWeeAppBundle = [[NSBundle bundleForClass:[self class]] retain];
}

- (id)init
{
    if ((self = [super init])) {}
    return self;
}

- (void)dealloc
{
    [_view release];
    [_backgroundView release];
    [_webView release];
    [super dealloc];
}

- (void)loadFullView
{
    _webView = [[UIWebView alloc] init];
    _webView.frame = CGRectInset(_backgroundView.bounds, 4.f, 4.f);
    _webView.scalesPageToFit = YES;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://rainmap-kobe250.jp/pic3.png"]]];
    [_backgroundView addSubview:_webView];
}

- (void)loadPlaceholderView
{
    _view = [[UIView alloc] initWithFrame:(CGRect){CGPointZero, {316.f, VIEW_HEIGHT}}];
    _view.autoresizingMask = UIViewAutoresizingFlexibleWidth;

    UIImage *bgImg = [UIImage imageWithContentsOfFile:@"/System/Library/WeeAppPlugins/StocksWeeApp.bundle/WeeAppBackground.png"];
    UIImage *stretchableBgImg = [bgImg stretchableImageWithLeftCapWidth:floorf(bgImg.size.width / 2.f) topCapHeight:floorf(bgImg.size.height / 2.f)];
    _backgroundView = [[UIImageView alloc] initWithImage:stretchableBgImg];
    _backgroundView.frame = CGRectInset(_view.bounds, 2.f, 0.f);
    _backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [_view addSubview:_backgroundView];
}

- (void)unloadView {
    [_view release];
    _view = nil;
    [_backgroundView release];
    _backgroundView = nil;
    [_webView release];
    _webView = nil;
}

- (float)viewHeight
{
    return VIEW_HEIGHT;
}
@end