//
//  ViewController.swift
//  ReadApp
//
//  Created by Yağmur Polat on 5.02.2022.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollViewer: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var signBtn: UIButton!
    @IBOutlet weak var getStartedBtn: UIButton!
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    
    var titles = ["WELCOME TO READMORE!",
                  "ADD YOUR FAVORITE SONGS",
                  "SHARE YOUR CHOICES GLOBALLY"]
    
    var descriptions = ["YOU CAN CRATE YOUR OWN DIGITAL LIBRARY",
                        "CREATE A PLAYLIST, MATCH YOUR BOOKS AND SONGS",
                        "LET PEOPLE EXPERIENCE YOUR DYNAMIC LIBRARY"]
    
    var images = ["first",
                  "second",
                  "third"]
    
    override func viewDidLayoutSubviews() {
        scrollWidth = scrollViewer.frame.size.width
        scrollHeight = scrollViewer.frame.size.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        // Do any additional setup after loading the view.
        
        self.scrollViewer.delegate = self
        scrollViewer.isPagingEnabled = true
        scrollViewer.showsHorizontalScrollIndicator = false
        scrollViewer.showsVerticalScrollIndicator = false
        
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)

        for index in 0..<titles.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)

        let slide = UIView(frame: frame)
            
            
        let imageView = UIImageView.init(image: UIImage.init(named: images[index]))
            imageView.frame = CGRect(x:0,y:0,width:300,height:300)
            imageView.contentMode = .scaleAspectFit
            imageView.center = CGPoint(x:scrollWidth/2,y: scrollHeight/2 - 50)
                      
        let titleText = UILabel.init(frame: CGRect(x:32,y:imageView.frame.maxY+30,width:scrollWidth-64,height:30))
            titleText.textAlignment = .center
            titleText.numberOfLines = 3
            titleText.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
            titleText.textColor = UIColor(named: "titleColor")
            titleText.text = titles[index]

        let descriptionText = UILabel.init(frame: CGRect(x:32,y:titleText.frame.maxY+10,width:scrollWidth-64,height:50))
            descriptionText.textAlignment = .center
            descriptionText.numberOfLines = 3
            descriptionText.font = UIFont(name: "HelveticaNeue-Light", size: 15)
            descriptionText.textColor = UIColor(named: "titleColor")
            descriptionText.text = descriptions[index]
            

            slide.addSubview(imageView)
            slide.addSubview(titleText)
            slide.addSubview(descriptionText)
            scrollViewer.addSubview(slide)
    }

        scrollViewer.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeight)

                    
        self.scrollViewer.contentSize.height = 1.0

                    
        pageController.numberOfPages = titles.count
        pageController.currentPage = 0
            
        
}
    
    @IBAction func pageChanged(_ sender: Any) {
        scrollViewer!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat((pageController?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
    }
    

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            setIndiactorForCurrentPage()
        }

    func setIndiactorForCurrentPage()  {
        let page = (scrollViewer?.contentOffset.x)!/scrollWidth
        pageController?.currentPage = Int(page)
    
    }
    
        
}
