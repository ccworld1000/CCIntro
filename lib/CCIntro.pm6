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

use JSON::Fast;

# holder var
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

# use data
our %basicInfoData is export = ();
our @informationData is export = ();
our %specialitiesData is export = ();
our %skillsListData is export = ();
our @skillsDescriptionData is export = ();
our %experienceData is export = ();
our @projectData is export = ();
our @openSourceData is export = ();
our %interestsData is export = ();
our %communityData is export = ();

#music
our $musicMP3Name is export = '';

sub genHolder is export {
	my $string = shift @_;
	my $holder = "%{$string}%"
}

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
            <p class="copyright">
						<!--
						2017 - now
						<a href="https://github.com/ccworld1000">CC</a> &
            <a href="https://github.com/ccworld1000">ccworld1000</a> &
						-->
						<a href="https://github.com/ccworld1000/CCIntro">Automatic generation by CCIntro </a></p>
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
		<script>
    var sound = new Howl({
      src: ['$musicMP3Name']
    });

		sound.play();
		</script>
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
		<script type='text/javascript' src='$basePath/js/vendor/howler.js'></script>
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

###############################################

sub p {
  my $p =  shift @_;
  my $content = "<p>{$p}</p>";
}

sub strong {
  my $strong =  shift @_;
  return "<strong>{$strong}</strong>";
}

sub div {
	my $div = shift @_;
	return "<div>{$div}</div>"
}

sub a {
	my ($a, $link) = @_;
	return "<a href='$link'>{$a}</a>"
}

sub genBasicInfo is export {
	my $content = "";

	for %basicInfoData.kv -> $k, $v {
		my @valueArray = @($v);
		my $valueHtml = "";
		for (@valueArray) {
			$valueHtml = $valueHtml ~ "<li>{$_}</li>"
		}

		$content = $content ~
				"<div class=\"large-3 columns\">" ~
						"<div class=\"row\">" ~
						"<div class=\"small-4 columns light2\">{$k}</div>" ~
						"<div class=\"small-8 columns border-left light2\">" ~
						"<ul class=\"no-bullet\">" ~
						$valueHtml ~
						"</ul>" ~
						"</div>" ~
						"</div>" ~
				"</div>";
	}

	return $content;
}

sub genInformation is export {
	my $content = '';

	for (@informationData) {
		for (@($_)) {
			$content = $content ~ p($_);
		}
	}

	return $content;
}

sub genSpecialities is export {
	my $content = '';

	my $index = 1;
	for %specialitiesData.kv -> $k, $v {
		my $valueInt = Int($v);
		my $left = 100 - $valueInt;

		$content = $content ~
					"<div class=\"large-4 medium-4 small-6 columns\">" ~
							"<ul data-pie-id=\"$index\" class=\"pie_desc\">" ~
							"<li data-value=\"{$valueInt}\">" ~
							"<div class=\"skill_info\"><span class=\"skill_name\">{$k}</span><span class=\"skill_level\">{$valueInt}</span></div>" ~
							"</li>" ~
							"<li data-value=\"$left\"></li>" ~
							"</ul>" ~
							"<div id=\"$index\" class=\"pie  animated bounceIn\"></div>" ~
					"</div>";
		$index++;
	}

	return $content;
}

sub genSkillsList is export {
	my $content = '';

	for %skillsListData.kv -> $k, $v {
		my $valueInt = Int($v);
		my $roundHtml = '';
		# for (0 .. 8 ) {
		for (0 .. 7 ) {
			my $li = '';
			if ($valueInt > $_ ) {
				$li = "<li><span></span></li>";
			} else {
				$li = "<li><span class=\"grey\"></span></li>";
			}

			$$roundHtml = $roundHtml ~ $li;
		}

		$content = $content ~
				"<ul class=\"small-block-grid-2\">" ~
						"<li class=\"name\">{$k}</li>" ~
						"<li>" ~
						"<ul class=\"small-block-grid-8 ellipses\">" ~
						$roundHtml ~
						"</ul>" ~
						"</li>" ~
				"</ul>";
	}

	return $content;
}

sub genSkillsDescription is export {
	my $content = '';

	for (@skillsDescriptionData) {
		for (@($_)) {
			$content = $content ~ "<div class=\"name\">{$_}</div>";
		}
	}

	return $content;
}

sub genExperience is export {
	my $content = "";

	for %experienceData.kv -> $k, $v {
		my @valueArray = @($v);
		my $valueHtml = "";
		for (@valueArray) {
			$valueHtml = $valueHtml ~ "<div class=\"date\">{$_}</div>"
		}

		$content = $content ~
				"<div class=\"large-6 medium-6 small-12 columns animated fadeIn\">" ~
						"<div class=\"year\">{$k}</div>" ~
						"<div class=\"exp_data\">" ~
						$valueHtml ~
						"</div>" ~
				"</div>";
	}

	return $content;
}

sub genProject is export {
    my $content = "";

		for (@projectData) {
			for (@($_)) {
				my $proDescsHtml = '';
				my $valueDict = $_;

				my $category = $valueDict{"category"};
				my $pro_name = $valueDict{"pro_name"};
				my @proDescs = $valueDict{"pro_desc"};

        for (@proDescs) {
            $proDescsHtml = $proDescsHtml ~ "<li class=\"desc_line\">{$_}</li>"
        }

        $content = $content ~
            "<div class=\"pro_item\">" ~
                "<div class=\"category\">{$category}</div>" ~
                "<div class=\"pro_name\">{$pro_name}</div>" ~
                "<div class=\"pro_desc\">" ~
                "<ul>" ~
                $proDescsHtml ~
                "</ul>" ~
                "</div>" ~
            "</div>";
			}
		}

    return $content;
}

sub genOpenSource is export {
	my $content = "";

	for (@openSourceData) {
		for (@($_)) {
			my $valueDict = $_;

			my $name = $valueDict{"name"};
			my $title = $valueDict{"title"};
			my $description = $valueDict{"description"};
			my $link = $valueDict{"link"};

			$content = $content ~
					"<div class=\"large-12 small-12 columns animated fadeIn\">" ~
							"<div class=\"row\">" ~
							"<div class=\"large-3 medium-3 small-4 columns\">" ~
							"<div class=\"category\" style=\"font-size:10px\">{$name}</div><img src=\"$basePath/img/ribbon.svg\" width=\"100\" height=\"131\" alt=\"{$title}\" class=\"ribbon\"></div>" ~
							"<div class=\"large-9 medium-9 small-8 columns\">" ~
							"<div class=\"recog_data\">" ~
							"<div class=\"title\"><a href='$link'>{$title}</a></div>" ~
							"<div class=\"desc\">{$description}</div>" ~
							"</div>" ~
							"</div>" ~
							"</div>" ~
					"</div>";
		}
	}

	return $content;
}

sub genInterests is export {
	my $content = '';

	for %interestsData.kv -> $k, $v {
			$content = $content ~
					"<div class=\"large-3 small-6 medium-3 columns animated bounceIn\">" ~
							"<div class=\"int_icon\"><i class=\"{$v}\"></i>" ~
							"<div class=\"activity\">{$k}</div>" ~
							"</div>" ~
					"</div>";
	}

	return $content;
}

sub genCommunity is export {
	my $content = '';

	for %communityData.kv -> $k, $v {
			$content = $content ~
					"<tr>" ~
							"<td>{$k}</td>" ~
							"<td>{$v}</td>" ~
					"</tr>";
	}

	return $content;
}
