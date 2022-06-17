//
//  main.m
//  AVFoundationFormatList
//
//  Created by Saúl Ibarra Corretgé on 16/06/2022.
//

#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>
#import <Foundation/Foundation.h>

#define FOURCC_STR(code)                                     \
    (char[5])                                               \
    {                                                       \
	(char)((code >> 24) & 0xFF),         \
        (char)((code >> 16) & 0xFF), \
        (char)((code >> 8) & 0xFF),  \
        (char)(code & 0xFF), 0       \
    }

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AVCaptureDeviceDiscoverySession *session = [AVCaptureDeviceDiscoverySession
                      discoverySessionWithDeviceTypes:@[AVCaptureDeviceTypeBuiltInWideAngleCamera, AVCaptureDeviceTypeExternalUnknown]
                                            mediaType:AVMediaTypeVideo
                                             position:AVCaptureDevicePositionUnspecified];
        NSArray<AVCaptureDevice *> *devices = session.devices;
        for (AVCaptureDevice *device in devices) {
            NSLog(@"%@ %@ %@", device.localizedName, device.uniqueID, device.modelID);
            for (AVCaptureDeviceFormat *format in device.formats) {
                FourCharCode fourcc = CMFormatDescriptionGetMediaSubType(format.formatDescription);
                NSLog(@"\t %@ (%s)", format, FOURCC_STR(fourcc));
            }
        }
    }

    return 0;
}
