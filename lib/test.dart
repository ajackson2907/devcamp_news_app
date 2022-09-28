import 'dart:convert';

import 'package:devcamp_news_app/news_list_model.dart';

final testData = NewsList.fromJson(jsonDecode('''
{
    "totalArticles": 369352,
    "articles": [
        {
            "title": "Congress returns with a Friday shutdown deadline looming",
            "description": "At the White House, President Biden plans to deliver remarks Tuesday focused on “lowering health care costs and protecting and strengthening Medicare and Social Security.",
            "content": "Since the Supreme Court overturned Roe v. Wade, abortion rights supporters have turned to state courts to attempt to halt newly implemented abortion bans. The legal arguments vary, but many are hinged on the assertion that provisions in the state’s c... [294 chars]",
            "url": "https://www.washingtonpost.com/politics/2022/09/27/senate-shutdown-biden-social-security/",
            "image": "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/6X4XVXR2ZEI63OFPBICOLXB5WY.jpg&w=1440",
            "publishedAt": "2022-09-27T13:17:25Z",
            "source": {
                "name": "The Washington Post",
                "url": "https://www.washingtonpost.com"
            }
        },
        {
            "title": "Setback for Team Uddhav as Supreme Court allows EC to decide on ‘real Shiv Sena’",
            "description": "Uddhav Thackeray faction had argued before the court that Eknath Shinde cannot approach the EC as he has 'incurred disqualification.'",
            "content": "In a setback for Uddhav Thackeray, the Supreme Court Tuesday refused to stop the Election Commission (EC) from deciding on an application by Eknath Shinde-led group to be recognised as the real Shiv Sena and be allowed to use the party symbol. A five... [2715 chars]",
            "url": "https://indianexpress.com/article/india/sc-rejects-uddhav-plea-ec-shinde-real-shiv-sena-8176326/",
            "image": "https://images.indianexpress.com/2022/09/shinde-thackeray.jpeg",
            "publishedAt": "2022-09-27T13:10:19Z",
            "source": {
                "name": "The Indian Express",
                "url": "https://indianexpress.com"
            }
        },
        {
            "title": "Nearly 300 UK mortgage deals pulled in a day as pound’s fall heralds rate rise",
            "description": "Bank of Ireland, Clydesdale, Post Office Money and building societies among those to withdraw products",
            "content": "Nearly 300 mortgage deals have been pulled in the last 24 hours by banks and building societies after a fall in the pound fuelled forecasts of a jump in interest rates to nearly 6. The Bank of Ireland, Clydesdale Bank, Post Office Money and building... [3542 chars]",
            "url": "https://www.theguardian.com/money/2022/sep/27/uk-mortgage-deals-pulled-pound-rate-rise",
            "image": "https://i.guim.co.uk/img/media/e32c34a944901eefbb4829d61bcaf3736ead8f75/164_463_5308_3185/master/5308.jpg?width=1200&height=630&quality=85&auto=format&fit=crop&overlay-align=bottom%2Cleft&overlay-width=100p&overlay-base64=L2ltZy9zdGF0aWMvb3ZlcmxheXMvdGctZGVmYXVsdC5wbmc&enable=upscale&s=5219b39d2a4f67d1a8dd7118752d55a1",
            "publishedAt": "2022-09-27T13:04:00Z",
            "source": {
                "name": "The Guardian",
                "url": "https://www.theguardian.com"
            }
        },
        {
            "title": "Amazon Great Indian Festival Sale 2022: Best smart TV deals",
            "description": "Last week, Amazon launched the much-publicised Great Indian Festival sale on September 23. Prime members had one-day early access to the best offers on a wide range of products. The company is offering up to 70 per cent discounts on top branded smart TVs from Samsung, LG, Sony, and Xiaomi, among others till this weekend. Here are the top smart TV on offer on Amazon Great",
            "content": "Last week, Amazon launched the much-publicised Great Indian Festival sale on September 23. Prime members had one-day early access to the best offers on a wide range of products. The company is offering up to 70 per cent discounts on top branded smart... [5026 chars]",
            "url": "https://www.deccanherald.com/business/technology/amazon-great-indian-festival-sale-2022-best-smart-tv-deals-1148705.html",
            "image": "https://www.deccanherald.com/sites/dh/files/articleimages/2022/09/27/amazon-logo-reuters-file-photo-1148705-1664282802.jpg",
            "publishedAt": "2022-09-27T12:46:42Z",
            "source": {
                "name": "Deccan Herald",
                "url": "https://www.deccanherald.com"
            }
        },
        {
            "title": "Budget 2023 LIVE updates: Rent credit and major changes to tax brackets announced by Minister Donohoe",
            "description": "Paschal Donohoe and Michael McGrath will address the Dail at 1pm to declare their Budget",
            "content": "Budget 2023 has finally arrived and the Government is just hours away from unveiling its spending plans for the year ahead. Paschal Donohoe and Michael McGrath will address the Dail at 1pm to declare their Budget, worth an estimated €6.7bn, as well a... [631 chars]",
            "url": "https://www.dublinlive.ie/news/budget-2023-live-updates-latest-25109720",
            "image": "https://i2-prod.belfastlive.co.uk/incoming/article25117654.ece/ALTERNATES/s1200/0_JS278835113.jpg",
            "publishedAt": "2022-09-27T12:33:45Z",
            "source": {
                "name": "Dublin Live",
                "url": "https://www.dublinlive.ie"
            }
        },
        {
            "title": "Leaks on Russian gas pipelines raise concerns",
            "description": "A series of unusual leaks on two natural gas pipelines running from Russia under the Baltic Sea to Germany triggered concerns about possible sabotage Tuesday, overshadowing the inauguration of a long-awaited pipeline in Poland that will bring Norwegian gas to Europe in efforts to bolster energy independence from Moscow.",
            "content": "WARSAW, Poland - A series of unusual leaks on two natural gas pipelines running from Russia under the Baltic Sea to Germany triggered concerns about possible sabotage Tuesday, overshadowing the inauguration of a long-awaited pipeline in Poland that w... [5113 chars]",
            "url": "https://www.ctvnews.ca/business/leaks-on-russian-gas-pipelines-raise-concerns-about-sabotage-1.6085745",
            "image": "https://www.ctvnews.ca/content/dam/ctvnews/en/images/2022/6/1/nord-stream-pipeline-construction-event-in-2010-1-5927340-1654081728442.jpg",
            "publishedAt": "2022-09-27T12:04:23Z",
            "source": {
                "name": "CTV News",
                "url": "https://www.ctvnews.ca"
            }
        },
        {
            "title": "ECP ‘strongly rejects’ allegations levelled by ‘political figure’ amid audio leaks fiasco",
            "description": "Elections can only be held if assemblies complete their term or PM dissolves assemblies, says ECP.",
            "content": "The Election Commission of Pakistan (ECP) on Tuesday strongly rejected “irresponsible and baseless allegations” leveled by a “political figure”, saying the ECP will keep taking decisions under the law and the Constitution in fulfilment of its lawful ... [2021 chars]",
            "url": "https://www.dawn.com/news/1712260/ecp-strongly-rejects-allegations-levelled-by-political-figure-amid-audio-leaks-fiasco",
            "image": "https://i.dawn.com/large/2022/09/27165336c7e19df.jpg?r=165458",
            "publishedAt": "2022-09-27T11:56:09Z",
            "source": {
                "name": "DAWN.com",
                "url": "https://www.dawn.com"
            }
        },
        {
            "title": "Senate approves on 3rd reading SIM registration bill",
            "description": "Senate approves on 3rd reading SIM registration bill",
            "content": "VOTING 20-0-0, the Senate approved on third and final reading Senate Bill (SB) 1310 or the proposed SIM (subscriber identity module) Registration Act. SB 1310 requires the registration of SIM cards to curb cyber crimes such as identity theft and the ... [2457 chars]",
            "url": "https://www.manilatimes.net/2022/09/27/news/senate-approves-on-3rd-reading-sim-registration-bill/1860009",
            "image": "https://www.manilatimes.net/manilatimes/uploads/images/2022/09/27/112017.jpg",
            "publishedAt": "2022-09-27T11:51:09Z",
            "source": {
                "name": "The Manila Times",
                "url": "https://www.manilatimes.net"
            }
        },
        {
            "title": "Russia 'extremely concerned' by Nord Stream gas pipeline leaks, cause yet to be determined",
            "description": "Unexplained leaks have been detected by Denmark and Sweden in the two Nord Stream pipelines, which have been a focus of tension after Russia cut supplies to Europe.",
            "content": "The two Nord Stream gas pipelines linking Russia and Europe have been hit by unexplained leaks, according to Scandinavian authorities, raising suspicions of sabotage. Key points: The pipelines owned by Russian gas giant Gazprom are not in operation b... [3806 chars]",
            "url": "https://www.abc.net.au/news/2022-09-27/nord-stream-gas-pipeline-leaks/101480172",
            "image": "https://live-production.wcms.abc-cdn.net.au/b451a36c0a14330058344e8fc069f6ad?impolicy=wcms_crop_resize&cropH=2773&cropW=4930&xPos=0&yPos=257&width=862&height=485",
            "publishedAt": "2022-09-27T11:51:07Z",
            "source": {
                "name": "ABC News",
                "url": "https://www.abc.net.au"
            }
        },
        {
            "title": "Senate OKs on 3rd reading postponement of village, youth polls",
            "description": "Senate OKs on 3rd reading postponement of village, youth polls",
            "content": "THE Senate has approved on third and final reading a bill seeking to postpone the Barangay (village) and Sangguniang Kabataan (SK) or youth council elections from December 2022 to December 2023. With 17 affirmative votes and two against the postponem... [1933 chars]",
            "url": "https://www.manilatimes.net/2022/09/27/latest-stories/senate-oks-on-3rd-reading-postponement-of-village-youth-polls/1860010",
            "image": "https://www.manilatimes.net/manilatimes/uploads/images/2022/09/27/112018.jpg",
            "publishedAt": "2022-09-27T11:50:35Z",
            "source": {
                "name": "The Manila Times",
                "url": "https://www.manilatimes.net"
            }
        }
    ]
}
'''));
