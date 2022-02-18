//
//  ViewController.swift
//  Patricks
//
//  Created by 方仕賢 on 2022/2/18.
//

import UIKit

class ViewController: UIViewController {
    var pictureViews = [UIView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for x in 1...9 {
            shootBubbles(x: CGFloat(x*45), spinSpeed: CGFloat.random(in: 5...20), speed: Float.random(in: 0...1))
        }
    }
    
    @IBAction func makePatricks(_ sender: UISlider) {
        
        let pictureView = UIView(frame: CGRect(x: -50, y: 70, width: 414, height: 860))
        let count = Int(sender.value)
        
        
        if pictureViews.count > 0 {
            pictureViews[0].removeFromSuperview()
            pictureViews.removeAll()
        }
        
        for _ in 1...count {
            let randomScale = CGFloat.random(in: 0...0.5)
            pictureView.addSubview(patrickStar(scaleX: randomScale, scaleY: randomScale, x: CGFloat.random(in: -30...400), y: CGFloat.random(in: 0...700), rotate: CGFloat.random(in: 0...360)))
        }
        
        pictureViews.append(pictureView)
        view.addSubview(pictureView)
    }
    
    func shootBubbles(x: CGFloat, spinSpeed: CGFloat, speed: Float){
        let emitter = CAEmitterCell()
        emitter.contents = UIImage(named: "bubbles")?.cgImage
        emitter.birthRate = 10
        emitter.scale = 0.1
        emitter.velocity = 20
        emitter.speed = speed
        emitter.lifetimeRange = 30
        emitter.emissionRange = 30
        emitter.yAcceleration = -100
        emitter.spinRange = spinSpeed
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterCells = [emitter]
        emitterLayer.position = CGPoint(x: x, y: 900)
        view.layer.addSublayer(emitterLayer)
    }
    
    
    func patrickStar(scaleX: CGFloat, scaleY: CGFloat, x: CGFloat, y: CGFloat, rotate: CGFloat) -> UIView {
        
        let patrickView = UIView(frame: CGRect(x: x, y: y, width: 100, height: 100))
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        
        // left hand
        let leftHandPath = UIBezierPath()
        leftHandPath.move(to: CGPoint(x: 211, y: 227))
        leftHandPath.addLine(to: CGPoint(x: 117, y: 156))
        leftHandPath.addQuadCurve(to: CGPoint(x: 96, y: 173), controlPoint: CGPoint(x: 78, y: 123))
        leftHandPath.addLine(to: CGPoint(x: 165, y: 301))
        leftHandPath.close()
        
        let leftHandLayer = CAShapeLayer()
        leftHandLayer.path = leftHandPath.cgPath
        leftHandLayer.strokeColor = CGColor(red: 242/255, green: 90/255, blue: 62/255, alpha: 1)
        leftHandLayer.fillColor = CGColor(red: red, green: green, blue: blue, alpha: 1)
        leftHandLayer.lineWidth = 2.5
        
        patrickView.layer.addSublayer(leftHandLayer)
        
        
        //body
        let bodyPath = UIBezierPath()
        bodyPath.move(to: CGPoint(x: 226, y: 195))
        bodyPath.addLine(to: CGPoint(x: 211, y: 227))
        bodyPath.addLine(to: CGPoint(x: 165, y: 301))
        bodyPath.addQuadCurve(to: CGPoint(x: 149, y: 354), controlPoint: CGPoint(x: 142, y: 326))
        bodyPath.addQuadCurve(to: CGPoint(x: 400, y: 361), controlPoint: CGPoint(x: 260, y: 440))
        bodyPath.addQuadCurve(to: CGPoint(x: 389, y: 313), controlPoint: CGPoint(x: 404, y: 333))
        bodyPath.addLine(to: CGPoint(x: 356, y: 235))
        
        let bodyLayer = CAShapeLayer()
        bodyLayer.path = bodyPath.cgPath
        bodyLayer.strokeColor = CGColor(red: 242/255, green: 90/255, blue: 62/255, alpha: 1)
        bodyLayer.fillColor = CGColor(red: red, green: green, blue: blue, alpha: 1)
        bodyLayer.lineWidth = 2.5
        patrickView.layer.addSublayer(bodyLayer)
        
        // head
        let headPath = UIBezierPath()
        headPath.move(to: CGPoint(x: 356, y: 235))
        headPath.addQuadCurve(to: CGPoint(x: 340, y: 78), controlPoint: CGPoint(x: 340, y: 207))
        headPath.addQuadCurve(to: CGPoint(x: 358, y: 30), controlPoint: CGPoint(x: 362, y: 56))
        headPath.addQuadCurve(to: CGPoint(x: 338, y: 21), controlPoint: CGPoint(x: 356, y: 14))
        headPath.addQuadCurve(to: CGPoint(x: 256, y: 130), controlPoint: CGPoint(x: 268, y: 71))
        headPath.addLine(to: CGPoint(x: 226, y: 195))
        
        
        let headLayer = CAShapeLayer()
        headLayer.path = headPath.cgPath
        headLayer.strokeColor = CGColor(red: 242/255, green: 90/255, blue: 62/255, alpha: 1)
        headLayer.fillColor = CGColor(red: red, green: green, blue: blue, alpha: 1)
        headLayer.lineWidth = 2.5
        patrickView.layer.addSublayer(headLayer)
        
        // right hand
        let rightHandPath = UIBezierPath()
        rightHandPath.move(to: CGPoint(x: 336, y: 253))
        rightHandPath.addQuadCurve(to: CGPoint(x: 465, y: 163), controlPoint: CGPoint(x: 412, y: 181))
        rightHandPath.addQuadCurve(to: CGPoint(x: 480, y: 182), controlPoint: CGPoint(x: 496, y: 143))
        rightHandPath.addLine(to: CGPoint(x: 381, y: 325))
        
        let rightHandLayer = CAShapeLayer()
        rightHandLayer.path = rightHandPath.cgPath
        rightHandLayer.strokeColor = CGColor(red: 242/255, green: 90/255, blue: 62/255, alpha: 1)
        rightHandLayer.fillColor = CGColor(red: red, green: green, blue: blue, alpha: 1)
        rightHandLayer.lineWidth = 2.5
        patrickView.layer.addSublayer(rightHandLayer)
        
        
        // left eye
        let leftEyePath = UIBezierPath()
        leftEyePath.move(to: CGPoint(x: 270, y: 148))
        leftEyePath.addQuadCurve(to: CGPoint(x: 232, y: 141), controlPoint: CGPoint(x: 256, y: 124))
        leftEyePath.addQuadCurve(to: CGPoint(x: 222, y: 183), controlPoint: CGPoint(x: 213, y: 162))
        leftEyePath.addQuadCurve(to: CGPoint(x: 262, y: 192), controlPoint: CGPoint(x: 232, y: 210))
        leftEyePath.addQuadCurve(to: CGPoint(x: 270, y: 148), controlPoint: CGPoint(x: 256, y: 167))
        
        let leftEyeLayer = CAShapeLayer()
        leftEyeLayer.path = leftEyePath.cgPath
        leftEyeLayer.fillColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        leftEyeLayer.strokeColor = CGColor(gray: 0, alpha: 1)
        leftEyeLayer.lineWidth = 2.5
        patrickView.layer.addSublayer(leftEyeLayer)
        
        // right eye
        let rightEyePath = UIBezierPath()
        rightEyePath.move(to: CGPoint(x: 270, y: 148))
        rightEyePath.addQuadCurve(to: CGPoint(x: 309, y: 153), controlPoint: CGPoint(x: 299, y: 123))
        rightEyePath.addQuadCurve(to: CGPoint(x: 295, y: 200), controlPoint: CGPoint(x: 313, y: 182))
        rightEyePath.addQuadCurve(to: CGPoint(x: 262, y: 192), controlPoint: CGPoint(x: 275, y: 212))
        rightEyePath.addQuadCurve(to: CGPoint(x: 270, y: 148), controlPoint: CGPoint(x: 256, y: 167))
        
        let rightEyeLayer = CAShapeLayer()
        rightEyeLayer.path = rightEyePath.cgPath
        rightEyeLayer.fillColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        rightEyeLayer.strokeColor = CGColor(gray: 0, alpha: 1)
        rightEyeLayer.lineWidth = 2.5
        patrickView.layer.addSublayer(rightEyeLayer)
        
        // left eyebrow
        let leftEyebrow = UIBezierPath()
        leftEyebrow.move(to: CGPoint(x: 268, y: 106))
        leftEyebrow.addLine(to: CGPoint(x: 257, y: 110))
        leftEyebrow.addQuadCurve(to: CGPoint(x: 259, y: 114), controlPoint: CGPoint(x: 254, y: 112))
        leftEyebrow.addLine(to: CGPoint(x: 270, y: 110))
        leftEyebrow.addQuadCurve(to: CGPoint(x: 268, y: 106), controlPoint: CGPoint(x: 272, y: 105))
        
        let leftEyebrowLayer = CAShapeLayer()
        leftEyebrowLayer.path = leftEyebrow.cgPath
        leftEyebrowLayer.fillColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        leftEyebrowLayer.strokeColor = CGColor(gray: 0, alpha: 1)
        leftEyebrowLayer.lineWidth = 1.5
        patrickView.layer.addSublayer(leftEyebrowLayer)
        
        // left eyebrow animation
        let leftEyebrowAnimation = CABasicAnimation(keyPath: "position")
        leftEyebrowAnimation.fromValue = [0, 0]
        leftEyebrowAnimation.toValue = [0, 10]
        leftEyebrowAnimation.duration = 0.1
        leftEyebrowAnimation.autoreverses = true
        leftEyebrowAnimation.repeatCount = .infinity
        
        leftEyebrowLayer.add(leftEyebrowAnimation, forKey: "animationPosition")
        
        
        //right eyebrow
        let rightEyebrowPath = UIBezierPath()
        rightEyebrowPath.move(to: CGPoint(x: 297, y: 109))
        rightEyebrowPath.addQuadCurve(to: CGPoint(x: 307, y: 121), controlPoint: CGPoint(x: 311, y: 120))
        rightEyebrowPath.addLine(to: CGPoint(x: 296, y: 113))
        rightEyebrowPath.addQuadCurve(to: CGPoint(x: 297, y: 109), controlPoint: CGPoint(x: 294, y: 107))
        
        let rightEyebrowLayer = CAShapeLayer()
        rightEyebrowLayer.path = rightEyebrowPath.cgPath
        rightEyebrowLayer.fillColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        rightEyebrowLayer.strokeColor = CGColor(gray: 0, alpha: 1)
        rightEyebrowLayer.lineWidth = 1.5
        patrickView.layer.addSublayer(rightEyebrowLayer)
        
        let rightEyebrowAnimation = CABasicAnimation(keyPath: "position")
        rightEyebrowAnimation.fromValue = [0, 0]
        rightEyebrowAnimation.toValue = [0, -10]
        rightEyebrowAnimation.duration = 0.1
        rightEyebrowAnimation.autoreverses = true
        rightEyebrowAnimation.repeatCount = .infinity
        
        rightEyebrowLayer.add(rightEyebrowAnimation, forKey: "animationPosition")
        
        // left black eye
        let aDegree = CGFloat.pi / 1
        let leftBlackEyePath = UIBezierPath(arcCenter: CGPoint(x: 245, y: 168), radius: 7, startAngle: aDegree * 0, endAngle: aDegree * 180, clockwise: true)
        
        let leftBlackEyeLayer = CAShapeLayer()
        leftBlackEyeLayer.path = leftBlackEyePath.cgPath
        leftBlackEyeLayer.fillColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        
        patrickView.layer.addSublayer(leftBlackEyeLayer)
        //animation path
    
        let leftBlackEyeAnimation = CABasicAnimation(keyPath: "position")
        leftBlackEyeAnimation.fromValue = [0, 0]
        leftBlackEyeAnimation.toValue = [0, -10]
        leftBlackEyeAnimation.duration = 0.5
        leftBlackEyeAnimation.autoreverses = true
        leftBlackEyeAnimation.repeatCount = .infinity
        
        leftBlackEyeLayer.add(leftBlackEyeAnimation, forKey: "animatePosition")
        
        // right black eye
        let rightBlackEye = UIBezierPath(arcCenter: CGPoint(x: 288, y: 168), radius: 7, startAngle: aDegree * 0, endAngle: aDegree * 180, clockwise: true)
        
        let rightBlackEyeLayer = CAShapeLayer()
        rightBlackEyeLayer.path = rightBlackEye.cgPath
        rightBlackEyeLayer.fillColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        patrickView.layer.addSublayer(rightBlackEyeLayer)
       
        //rightBlackEye animation
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = [0, 0]
        animation.toValue = [0, 20]
        animation.duration = 0.5
        animation.autoreverses = true
        animation.repeatCount = .infinity
        rightBlackEyeLayer.add(animation, forKey: "animatePosition")
        
        // mouth
        let mouthPath = UIBezierPath()
        mouthPath.move(to: CGPoint(x: 317, y: 210))
        mouthPath.addQuadCurve(to: CGPoint(x: 228, y: 222), controlPoint: CGPoint(x: 284, y: 242))
        mouthPath.addLine(to: CGPoint(x: 236, y: 225))
        mouthPath.addQuadCurve(to: CGPoint(x: 218, y: 265), controlPoint: CGPoint(x: 244, y: 250))
        mouthPath.addLine(to: CGPoint(x: 208, y: 260))
        mouthPath.addQuadCurve(to: CGPoint(x: 317, y: 210), controlPoint: CGPoint(x: 293, y: 306))
        mouthPath.move(to: CGPoint(x: 309, y: 205))
        mouthPath.addLine(to: CGPoint(x: 323, y: 213))
        
        let mouthLayer = CAShapeLayer()
        mouthLayer.path = mouthPath.cgPath
        mouthLayer.fillColor = CGColor(red: 113/255, green: 45/255, blue: 52/255, alpha: 1)
        mouthLayer.strokeColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        mouthLayer.lineWidth = 1.5
        patrickView.layer.addSublayer(mouthLayer)
        
        //tongue
        let tonguePath = UIBezierPath()
        tonguePath.move(to: CGPoint(x: 231, y: 271))
        tonguePath.addQuadCurve(to: CGPoint(x: 270, y: 258), controlPoint: CGPoint(x: 255, y: 243))
        tonguePath.addLine(to: CGPoint(x: 260, y: 267))
        tonguePath.addQuadCurve(to: CGPoint(x: 297, y: 256), controlPoint: CGPoint(x: 281, y: 245))
        tonguePath.addQuadCurve(to: CGPoint(x: 231, y: 272), controlPoint: CGPoint(x: 268, y: 287))
        
        let tongueLayer = CAShapeLayer()
        tongueLayer.path = tonguePath.cgPath
        tongueLayer.fillColor = CGColor(red: 251/255, green: 185/255, blue: 195/255, alpha: 1)
        tongueLayer.strokeColor = CGColor(red: 143/255, green: 64/255, blue: 77/255, alpha: 1)
        tongueLayer.lineWidth = 1
        patrickView.layer.addSublayer(tongueLayer)
        
        //pants
        let pantsPath = UIBezierPath()
        pantsPath.move(to: CGPoint(x: 147, y: 354))
        pantsPath.addQuadCurve(to: CGPoint(x: 402, y: 360), controlPoint: CGPoint(x: 273, y: 440))
        pantsPath.addQuadCurve(to: CGPoint(x: 364, y: 460), controlPoint: CGPoint(x: 414, y: 427))
        pantsPath.addLine(to: CGPoint(x: 365, y: 488))
        pantsPath.addQuadCurve(to: CGPoint(x: 276, y: 493), controlPoint: CGPoint(x: 320, y: 515))
        pantsPath.addLine(to: CGPoint(x: 280, y: 471))
        pantsPath.move(to: CGPoint(x: 280, y: 481))
        pantsPath.addQuadCurve(to: CGPoint(x: 147, y: 354), controlPoint: CGPoint(x: 120, y: 470))
        pantsPath.move(to: CGPoint(x: 233, y: 473))
        pantsPath.addLine(to: CGPoint(x: 233, y: 486))
        pantsPath.addQuadCurve(to: CGPoint(x: 156, y: 468), controlPoint: CGPoint(x: 186, y: 500))
        pantsPath.addLine(to: CGPoint(x: 166, y: 440))
        
        let pantsLayer = CAShapeLayer()
        pantsLayer.path = pantsPath.cgPath
        pantsLayer.fillColor = CGColor(red: 214/255, green: 218/255, blue: 34/255, alpha: 1)
        pantsLayer.strokeColor = CGColor(gray: 0, alpha: 1)
        pantsLayer.lineWidth = 3
        patrickView.layer.addSublayer(pantsLayer)
        
        // color make up
        let pantsPath2 = UIBezierPath()
        pantsPath2.move(to: CGPoint(x: 278, y: 478))
        pantsPath2.addQuadCurve(to: CGPoint(x: 147, y: 354), controlPoint: CGPoint(x: 175, y: 432))
        pantsPath2.addLine(to: CGPoint(x: 280, y: 471))
        
        let pantsLayer2 = CAShapeLayer()
        pantsLayer2.path = pantsPath2.cgPath
        pantsLayer2.fillColor = pantsLayer.fillColor
        pantsLayer2.strokeColor = UIColor.clear.cgColor
        patrickView.layer.addSublayer(pantsLayer2)
        
        //left leg
        let leftLegPath = UIBezierPath()
        leftLegPath.move(to: CGPoint(x: 223, y: 490))
        leftLegPath.addQuadCurve(to: CGPoint(x: 168, y: 480), controlPoint: CGPoint(x: 211, y: 566))
        leftLegPath.addQuadCurve(to: CGPoint(x: 223, y: 490), controlPoint: CGPoint(x: 198, y: 499))
        
        let leftLegLayer = CAShapeLayer()
        leftLegLayer.path = leftLegPath.cgPath
        leftLegLayer.strokeColor = CGColor(red: 242/255, green: 90/255, blue: 62/255, alpha: 1)
        leftLegLayer.fillColor = CGColor(red: red, green: green, blue: blue, alpha: 1)
        leftLegLayer.lineWidth = 2.5
        patrickView.layer.addSublayer(leftLegLayer)
        
        //right leg
        let rightLegPath = UIBezierPath()
        rightLegPath.move(to: CGPoint(x: 352, y: 495))
        rightLegPath.addQuadCurve(to: CGPoint(x: 292, y: 501), controlPoint: CGPoint(x: 330, y: 575))
        rightLegPath.addQuadCurve(to: CGPoint(x: 352, y: 495), controlPoint: CGPoint(x: 324, y: 510))
        
        let rightLegLayer = CAShapeLayer()
        rightLegLayer.path = rightLegPath.cgPath
        rightLegLayer.strokeColor = CGColor(red: 242/255, green: 90/255, blue: 62/255, alpha: 1)
        rightLegLayer.fillColor = CGColor(red: red, green: green, blue: blue, alpha: 1)
        rightLegLayer.lineWidth = 2.5
        patrickView.layer.addSublayer(rightLegLayer)
        
        //right flower
        let rightFlower = UIBezierPath()
        rightFlower.move(to: CGPoint(x: 389, y: 433))
        rightFlower.addQuadCurve(to: CGPoint(x: 343, y: 452), controlPoint: CGPoint(x: 369, y: 421))
        rightFlower.addLine(to: CGPoint(x: 357, y: 464))
        rightFlower.addQuadCurve(to: CGPoint(x: 348, y: 475), controlPoint: CGPoint(x: 360, y: 476))
        rightFlower.addLine(to: CGPoint(x: 341, y: 469))
        rightFlower.addQuadCurve(to: CGPoint(x: 334, y: 499), controlPoint: CGPoint(x: 304, y: 467))
        rightFlower.addQuadCurve(to: CGPoint(x: 363, y: 486), controlPoint: CGPoint(x: 355, y: 493))
        rightFlower.addLine(to: CGPoint(x: 363, y: 458))
        rightFlower.addQuadCurve(to: CGPoint(x: 389, y: 433), controlPoint: CGPoint(x: 381, y: 447))
        
        
        let rightFlowerLayer = CAShapeLayer()
        rightFlowerLayer.path = rightFlower.cgPath
        rightFlowerLayer.fillColor = CGColor(red: 161/255, green: 131/255, blue: 183/255, alpha: 1)
        rightFlowerLayer.strokeColor = CGColor(red: 155/255, green: 150/255, blue: 94/255, alpha: 1)
        rightFlowerLayer.lineWidth = 1.5
        patrickView.layer.addSublayer(rightFlowerLayer)
        
    // pantsLine
        let pantsLine = UIBezierPath()
        pantsLine.move(to: CGPoint(x: 146, y: 369))
        pantsLine.addQuadCurve(to: CGPoint(x: 401, y: 373), controlPoint: CGPoint(x: 266, y: 452))
        pantsLine.addQuadCurve(to: CGPoint(x: 146, y: 369), controlPoint: CGPoint(x: 266, y: 452))
        
        let pantsLineLayer = CAShapeLayer()
        pantsLineLayer.path = pantsLine.cgPath
        pantsLineLayer.strokeColor = UIColor.black.cgColor
        patrickView.layer.addSublayer(pantsLineLayer)
        
        // left flower
        let leftFlower = UIBezierPath()
        leftFlower.move(to: CGPoint(x: 169, y: 385))
        leftFlower.addQuadCurve(to: CGPoint(x: 169, y: 415), controlPoint: CGPoint(x: 150, y: 411))
        leftFlower.addLine(to: CGPoint(x: 180, y: 410))
        leftFlower.addQuadCurve(to: CGPoint(x: 184, y: 417), controlPoint: CGPoint(x: 189, y: 405))
        leftFlower.addLine(to: CGPoint(x: 176, y: 425))
        leftFlower.addQuadCurve(to: CGPoint(x: 221, y: 444), controlPoint: CGPoint(x: 196, y: 454))
        leftFlower.addLine(to: CGPoint(x: 222, y: 432))
        leftFlower.addQuadCurve(to: CGPoint(x: 230, y: 430), controlPoint: CGPoint(x: 224, y: 423))
        leftFlower.addLine(to: CGPoint(x: 234, y: 441))
        leftFlower.addQuadCurve(to: CGPoint(x: 260, y: 413), controlPoint: CGPoint(x: 262, y: 435))
        leftFlower.addQuadCurve(to: CGPoint(x: 169, y: 385), controlPoint: CGPoint(x: 213, y: 410))
        
        let leftFlowerLayer = CAShapeLayer()
        leftFlowerLayer.path = leftFlower.cgPath
        leftFlowerLayer.fillColor = CGColor(red: 161/255, green: 131/255, blue: 183/255, alpha: 1)
        leftFlowerLayer.strokeColor = CGColor(red: 155/255, green: 150/255, blue: 94/255, alpha: 1)
        leftFlowerLayer.lineWidth = 1.5
        patrickView.layer.addSublayer(leftFlowerLayer)
    
        // belly button
        let bellyButton = UIBezierPath()
        bellyButton.move(to: CGPoint(x: 234, y: 370))
        bellyButton.addQuadCurve(to: CGPoint(x: 204, y: 360), controlPoint: CGPoint(x: 207, y: 390))
        bellyButton.addQuadCurve(to: CGPoint(x: 234, y: 370), controlPoint: CGPoint(x: 207, y: 390))
        bellyButton.move(to: CGPoint(x: 221, y: 365))
        bellyButton.addQuadCurve(to: CGPoint(x: 211, y: 365), controlPoint: CGPoint(x: 220, y: 373))
        bellyButton.addQuadCurve(to: CGPoint(x: 217, y: 355), controlPoint: CGPoint(x: 205, y: 355))
        
        let bellyButtonLayer = CAShapeLayer()
        bellyButtonLayer.path = bellyButton.cgPath
        bellyButtonLayer.strokeColor = UIColor.black.cgColor
        bellyButtonLayer.fillColor = UIColor.clear.cgColor
        bellyButtonLayer.lineWidth = 2
        patrickView.layer.addSublayer(bellyButtonLayer)
        
        //dot 1
        let dot1 = UIBezierPath(arcCenter: CGPoint(x: 326, y: 66), radius: 3, startAngle: aDegree * 0, endAngle: aDegree * 180, clockwise: true)
        
        let dot1Layer = CAShapeLayer()
        dot1Layer.path = dot1.cgPath
        dot1Layer.fillColor = CGColor(red: 223/255, green: 127/255, blue: 131/255, alpha: 1)
        patrickView.layer.addSublayer(dot1Layer)
        
        //dot 2
        let dot2 = UIBezierPath(arcCenter: CGPoint(x: 222, y: 296), radius: 2, startAngle: aDegree * 0, endAngle: aDegree * 180, clockwise: true)
        
        let dot2Layer = CAShapeLayer()
        dot2Layer.path = dot2.cgPath
        dot2Layer.fillColor = CGColor(red: 223/255, green: 127/255, blue: 131/255, alpha: 1)
        patrickView.layer.addSublayer(dot2Layer)
        
        //dot 3
        let dot3 = UIBezierPath(arcCenter: CGPoint(x: 177, y: 333), radius: 2, startAngle: aDegree * 0, endAngle: aDegree * 180, clockwise: true)
        
        let dot3Layer = CAShapeLayer()
        dot3Layer.path = dot3.cgPath
        dot3Layer.fillColor = CGColor(red: 223/255, green: 127/255, blue: 131/255, alpha: 1)
        patrickView.layer.addSublayer(dot3Layer)
        
        //dot 4
        let dot4 = UIBezierPath(arcCenter: CGPoint(x: 265, y: 357), radius: 2, startAngle: aDegree * 0, endAngle: aDegree * 180, clockwise: true)
        
        let dot4Layer = CAShapeLayer()
        dot4Layer.path = dot4.cgPath
        dot4Layer.fillColor = CGColor(red: 223/255, green: 127/255, blue: 131/255, alpha: 1)
        patrickView.layer.addSublayer(dot4Layer)
        
        //dot 5
        let dot5 = UIBezierPath(arcCenter: CGPoint(x: 414, y: 253), radius: 2, startAngle: aDegree * 0, endAngle: aDegree * 180, clockwise: true)
        
        let dot5Layer = CAShapeLayer()
        dot5Layer.path = dot5.cgPath
        dot5Layer.fillColor = CGColor(red: 223/255, green: 127/255, blue: 131/255, alpha: 1)
        patrickView.layer.addSublayer(dot5Layer)
        
        // dot 6
        let dot6 = UIBezierPath(arcCenter: CGPoint(x: 158, y: 211), radius: 2, startAngle: aDegree * 0, endAngle: aDegree * 180, clockwise: true)
        
        let dot6Layer = CAShapeLayer()
        dot6Layer.path = dot6.cgPath
        dot6Layer.fillColor = CGColor(red: 223/255, green: 127/255, blue: 131/255, alpha: 1)
        patrickView.layer.addSublayer(dot6Layer)
        
        //dot 7
        let dot7 = UIBezierPath(arcCenter: CGPoint(x: 192, y: 507), radius: 2, startAngle: aDegree * 0, endAngle: aDegree * 180, clockwise: true)
        
        let dot7Layer = CAShapeLayer()
        dot7Layer.path = dot7.cgPath
        dot7Layer.fillColor = CGColor(red: 223/255, green: 127/255, blue: 131/255, alpha: 1)
        patrickView.layer.addSublayer(dot7Layer)
        
        patrickView.transform = CGAffineTransform(scaleX: scaleX, y: scaleY).rotated(by: rotate)
        
        return patrickView
    }


}

