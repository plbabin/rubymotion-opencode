class MainController < UIViewController
    include BW::KVO

    HEADER_HEIGHT = 44

    def viewDidLoad
      SVProgressHUD.show

      self.title = ""

      self.view.backgroundColor = UIColor.clearColor

      @tableView = UITableView.alloc.initWithFrame([self.view.bounds.origin,[self.view.bounds.size.width,self.view.bounds.size.height-HEADER_HEIGHT]])
      @tableView.dataSource = @tableView.delegate = self
      @tableView.separatorStyle = UITableViewCellSeparatorStyleNone
      @tableView.backgroundColor = UIColor.clearColor

      self.view.addSubview @tableView

      # remove header
      label = UILabel.alloc.init.autorelease
      self.navigationItem.titleView = label

      _loadData
    end

    def _loadData
      @editions = Editions.new

      observe(@editions, :list) do |old_value, new_value|
        if new_value
          @data = @editions.list
          @tableView.reloadData
          SVProgressHUD.dismiss
          NSLog("### DATA LOADED : #{@data.count}")
        else
          @data = []
          App.alert("unable to load data")
        end
      end

      @editions.load
    end

    # SECTIONS
    def tableView(tableView, viewForHeaderInSection:section)
      EditionHeaderView.alloc.initWithFrameAndText(tableView.bounds, @data[section]["title_fr"])
    end

    def numberOfSectionsInTableView(tableView)
      if @data then @data.count else 0 end
    end

    def tableView(tableView, heightForHeaderInSection:section)
      22
    end

    # ROWS
    def tableView(tableView, heightForRowAtIndexPath:indexPath)
      64
    end

    def tableView(tableView, numberOfRowsInSection:section)
      @data[section]["talks"].count
    end

    def tableView(tableView, cellForRowAtIndexPath: indexPath)
      @reuseIdentifier ||= "CELL_IDENTIFIER"

      cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
        TalkCell.alloc.initWithTalkStyle(@reuseIdentifier, inTableView:tableView)
      end

      # fill cell with data
      cell.row = indexPath.row;
      cell.section = indexPath.section

      talk = @data[indexPath.section]["talks"][indexPath.row]
      
      if talk
        cell.fillWithTalk(talk)
      end

      cell
    end

    def tableView(tableView, didSelectRowAtIndexPath:indexPath)
      editionController = EditionController.alloc.initWithNibName(nil, bundle:nil)
      editionController.edition_id = @data[indexPath.row]["id"]

      self.navigationController.pushViewController(editionController, animated:true)
    end

    def reloadTalk(section,row)
        @tableView.reloadRowsAtIndexPaths([NSIndexPath.indexPathForRow(row, inSection:section)], withRowAnimation:false)
    end

end