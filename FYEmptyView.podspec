
Pod::Spec.new do |s|


s.name                = "FYEmptyView"
s.version             = "0.0.1"
s.summary             = "uitableview的空页面显示"
s.homepage            = "https://github.com/sdwangxianwen/FYEmptyView"
s.license             = { :type => "Copyright", :text => "Copyright 2011 - 2018 UMeng.com. All rights reserved.\n" }
s.author             = { "wangwen" => "870183756@qq.com" }
s.platform            = :ios, "9.0"
s.source              = { :git => "https://github.com/sdwangxianwen/FYEmptyView.git", :tag => s.version }
s.source_files        = "emptyView/FYEmptyView/*.{h,m}"
s.requires_arc        = true

end
