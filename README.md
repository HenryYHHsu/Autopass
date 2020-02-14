Topic :
1. 特定商品滿 X 件折 Y 元或 Z %
2. 訂單滿 X 元折 Y 元或 Z %
3. 訂單滿 X 元免運費
4. 訂單滿 X 贈送特定商品
5. 特定供應商場品滿 X 件折 Y 元或 Z %
6. 折扣可限定總共只套用 N 次或總共優惠 Y 元
7. 折扣可限定每人只套用 N 次或總共優惠 Y 元
8. 折扣可限制特定時間內有效或是每月重新計算使用數量限制
訂單完成後寄送每人獨立的軟體序號

目前規劃:
	1. Product -> 基本欄位 
	                   - a. 名稱/數量/單價
	              -> 參與活動與否
	                 - a. 可根據活動id (確認該品項活動確認)
	              -> 關聯性 
	                 - a.  店家 (確認特定店家活動關聯性)
	2. Bill -> 整張單原始總價 => 根據活動確認訂單狀態  
	          (依照總價可得到下列功能
		 - a. 滿千送百
		 - b. 買500免運
		 - c.  滿3000送小禮物 )
	      -> 每張單有自己的特殊序號 (unique)
	       -> 關聯性
	          - a.  Belongs_to : User 
	3. Store -> 關聯性
	          - a. has_many : Product 
	           -> 功能
	          - a. 限定店活動
	4. 活動 -> 建立活動
	         -> 關聯性 
	          - a.
	         -> key factor
		 - a. 此次活動根據單一活動當作總數管理 (ex: 限量10000次)
		 - b. 此次活動根據User當作總量管制 (與User關聯性)
		 - c. 此次活動根據時間當作活動限制 
		 - d. 此次活動根據特定店家進行活動
	            - e. 此次活動根據特定商品進行活動
	          -> 活動內容 (value = total price)
	           - a.  滿千送百 
	           - b.  滿多少錢免運
	           - c.  滿多少錢送禮物
            - d.  滿多少錢打幾折