#!/usr/bin/env perl6
# -*- coding: utf-8 -*-
#
#  CCIntro.pm6
#
#  Created by CC on 2017/12/25.
#  Copyright 2017 youhua deng (deng you hua | CC) <ccworld1000@gmail.com>
#  https://github.com/ccworld1000/CCIntro
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#
#

our $basePath is export = '';
our $pageTitle is export = '';
our $pageDescription is export = '';
our $name is export = '';
our $description is export = '';
our $basicInfo is export = '';
our $information is export = '';
our $specialities is export = '';
our $skillsList is export = '';
our $skillsDescription is export = '';
our $GitHubID is export = '';
our $community is export = '';
our $experience is export = '';
our $project is export = '';
our $openSource is export = '';
our $interests is export = '';


sub genDivHeader is export {
	my $divHeader = qq {
    <div id="header">
        <div class="row animated fadeInDown">
            <div class="large-2 columns">
                <h2> $name </h2>
                <h6 class="light"> $description </h6></div>
             $basicInfo
            <div class="large-1 columns text-right website"><a href="mailto:ccworld1000@gmail.com"><i class="fi-arrow-down"></i>反馈</a></div>
        </div>
    </div>
	};
}

sub genDivMain is export {
	my $divMain = qq {
    <div class="row main">
        <div class="large-6 columns">
            <div class="avoid_pagebreak animated fadeInUp">
                <h4 class="title"><i class="fi-torso"></i> 个人简介</h4>
                <div class="info">
                     $information
                </div>
            </div>
            <div class="avoid_pagebreak animated fadeInUp">
                <h4 class="title"><i class="fi-like"></i> 技能专长</h4>
                <div class="row specialities">
                     $specialities
                </div>
            </div>
            <div class="avoid_pagebreak animated fadeInUp">
                <h4 class="title"><i class="fi-star"></i> 技能评价</h4>
                <div class="row skill">
                    <div class="large-7 columns animated fadeIn">
                        <h6>编程技能</h6>
                         $skillsList
                    </div>
                    <div class="large-5 columns animated fadeIn">
                        <h6>能力简述</h6>
                         $skillsDescription
                    </div>
                </div>
            </div>
            <div class="avoid_pagebreak animated fadeInUp">
                <h4 class="title"><i class="fi-social-github"></i> 社区经验</h4>
                <div class="community">
                    <p>Github：
                        <a href="https://github.com/$GitHubID"><img src="http://ghchart.rshah.org/$GitHubID" alt="Github Chart of $GitHubID" /></a></p>
                    <hr />
                    <table>
                        <thead>
                            <tr>
                                <th>领域</th>
                                <th>日常社区活动</th>
                            </tr>
                        </thead>
                        <tbody>
                             $community
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="large-6 columns">
            <div class="avoid_pagebreak animated fadeInUp">
                <h4 class="title"><i class="fi-lightbulb"></i> 个人经验</h4>
                <div class="row experience">
                     $experience
                </div>
            </div>
            <div class="avoid_pagebreak animated fadeInUp">
                <h4 class="title"><i class="fi-flag"></i> 项目经历（部分）</h4>
                <div class="pro_surround">
                    <div class="pro animated">
                         $project
                    </div>
                </div>
            </div>
            <div class="avoid_pagebreak animated fadeInUp">
                <h4 class="title"><i class="fi-book"></i> 开源项目</h4>
                <div class="row recognitions">
                     $openSource
                </div>
            </div>
            <div class="avoid_pagebreak animated fadeInUp">
                <h4 class="title"><i class="fi-link"></i> 扩展技能</h4>
                <div class="row interests">
                     $interests
                </div>
            </div>
        </div>
    </div>
	};
}

sub genDivFooter is export {
	my $divFooter = qq {
    <div class="row footer">
        <div class="large-12 small-12 medium-12 text-center ">
            <div class="border text-center "></div>
            <p class="copyright">2017 - now <a href="https://github.com/ccworld1000">CC</a> &
                <a href="https://github.com/ccworld1000">ccworld1000</a></p>
        </div>
    </div>
	};
}

sub genBody is export {
	my $divHeader = genDivHeader();
	my $divMain = genDivMain();
	my $divFooter = genDivFooter();

	my $body = qq {
<body>
    $divHeader
    $divMain
    $divFooter
    <script type="text/javascript">
    Pizza.init(document.body, \{
        donut: true,
        donut_inner_ratio: 0.7,
    \});
    </script>
</body>
	};

}

sub genLink is export {
	my $link = qq {
    <link rel="icon" type="image/jpeg" href="$basePath/img/favicon.jpg" />
    <link href="$basePath/css/notices.css" type="text/css" rel="stylesheet" />
    <link href="$basePath/css/normalize.css" type="text/css" rel="stylesheet" />
    <link href="$basePath/css/foundation.css" type="text/css" rel="stylesheet" />
    <link href="$basePath/icons/foundation-icons.css" type="text/css" rel="stylesheet" />
    <link href="$basePath/css/animate.css" type="text/css" rel="stylesheet" />
    <link href="$basePath/css/pizza.css" type="text/css" rel="stylesheet" />
    <link href="$basePath/css/app.css" type="text/css" rel="stylesheet" />
    <link href="$basePath/css/print.css" rel="stylesheet" type="text/css" media="print" />
	};
}

sub genScript is export {
	my $script = qq {
    <script type='text/javascript' src='$basePath/js/vendor/modernizr.js'></script>
    <script src="$basePath/js/jquery-2.x.min.js" type="text/javascript"></script>
    <script src="$basePath/js/foundation.min.js" type="text/javascript"></script>
    <script src="$basePath/js/vendor/snap.svg.js" type="text/javascript"></script>
    <script src="$basePath/js/pizza.js" type="text/javascript"></script>
	};
}

sub genHeader is export {
	my $link = genLink();
	my $script = genScript();
	my $header = qq {
<head>
    <meta charset="utf-8" />
    <title> $pageTitle </title>
    <meta name="description" content="$pageDescription" />
    <meta name="CCIntro" content="https://github.com/ccworld1000/CCIntro" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    $script
    $link
</head>
	};

}

sub genHTML is export {
	my $header = genHeader();
	my $body = genBody();
	my $html = qq {
<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="en"><![endif]-->
<html class="no-js" lang="en">
$header
$body
</html>
};
}
