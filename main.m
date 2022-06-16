//
//  main.m
//  AVFoundationFormatList
//
//  Created by Saúl Ibarra Corretgé on 16/06/2022.
//

#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AVCaptureDeviceDiscoverySession *session = [AVCaptureDeviceDiscoverySession
                      discoverySessionWithDeviceTypes:@[AVCaptureDeviceTypeExternalUnknown]
                                            mediaType:AVMediaTypeVideo
                                             position:AVCaptureDevicePositionUnspecified];
        NSArray<AVCaptureDevice *> *devices = session.devices;
        for (AVCaptureDevice *device in devices) {
            NSLog(@"%@ %@ %@", device.localizedName, device.uniqueID, device.modelID);
            for (AVCaptureDeviceFormat *format in device.formats) {
                NSLog(@"\t %@", format);
            }
        }
    }

    return 0;
}
