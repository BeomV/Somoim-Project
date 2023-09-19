package test.com.moim.report.model;

import lombok.Data;
import oracle.sql.DATE;

@Data
public class ReportsVO {
private int num;
private int board_num;
private int member_num;
private String user_id;
private String criminal;
private DATE report_date;
}
